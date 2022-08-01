import 'package:studyu_core/core.dart';
import 'package:studyu_designer_v2/domain/study.dart';
import 'package:studyu_designer_v2/routing/router_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum StudiesFilter with GoRouteParamEnum {
  all,
  owned,
  shared,
  public
}

extension StudiesFilterByUser on StudiesFilter {
  Iterable<Study> apply({required Iterable<Study> studies, required User user}) {
    switch (this) {
      case StudiesFilter.all:
        return studies;
      case StudiesFilter.owned:
        return studies.where((s) => s.isOwner(user));
      case StudiesFilter.shared:
        return studies.where((s) => s.isEditor(user));
      case StudiesFilter.public:
        // TODO: clarify whether to show also planned studies in draft status
        // TODO: also show study stubs (title, description) if confirmed
        return studies.where((s) => (s.status == StudyStatus.running ||
            s.status == StudyStatus.closed) && s.resultSharing == ResultSharing.public);
    }
  }
}