import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studyu_core/core.dart';
import 'package:studyu_designer_v2/features/study/study_test_controller.dart';
import 'package:studyu_flutter_common/studyu_flutter_common.dart';

class StudyTestScreen extends ConsumerStatefulWidget {
  StudyTestScreen(this.studyId, {Key? key}) : super(key: key);

  final String studyId;

  @override
  ConsumerState<StudyTestScreen> createState() => _StudyTestScreen();
}

class _StudyTestScreen extends ConsumerState<StudyTestScreen> {
  @override
  void initState() {
    super.initState();
    //subject = context.read<AppState>().activeSubject;
  }

  @override
  void didUpdateWidget(StudyTestScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final studyTestController =
        ref.read(studyTestControllerProvider(widget.studyId).notifier);

    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            studyTestController.platformController.scaffold,
            IconButton(
                icon: const Icon(Icons.restart_alt),
                onPressed: () {
                    studyTestController.platformController.sendCmd("reset");
                    //studyTestController.platformController.refresh();
                  }
            ),
          ],
        ));
  }
}
