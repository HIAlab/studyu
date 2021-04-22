import 'package:flutter/material.dart';
import 'package:studyou_core/core.dart';
import 'package:studyou_core/env.dart' as env;
import 'package:supabase/supabase.dart';

enum DesignerPage {
  about,
  interventions,
  eligibilityQuestions,
  eligibilityCriteria,
  observations,
  schedule,
  report,
  results,
  consent,
  save,
}

class AppState extends ChangeNotifier {
  String _selectedStudyId;
  Study draftStudy;
  DesignerPage _selectedDesignerPage = DesignerPage.about;
  Future<List<Study>> Function() _researcherDashboardQuery = Study.getResearcherDashboardStudies;

  AppState();

  String get selectedStudyId => _selectedStudyId;

  bool get isDesigner => draftStudy != null;

  bool get loggedIn => env.client.auth.session() != null;

  Future<List<Study>> Function() get researcherDashboardQuery => _researcherDashboardQuery;

  void reloadResearcherDashboard() => _researcherDashboardQuery = Study.getResearcherDashboardStudies;

  DesignerPage get selectedDesignerPage => _selectedDesignerPage;

  set selectedDesignerPage(DesignerPage page) {
    _selectedDesignerPage = page;
    notifyListeners();
  }

  void createStudy({DesignerPage page = DesignerPage.about}) {
    draftStudy = Study.withId(env.client.auth.user().id);
    _selectedStudyId = null;
    _selectedDesignerPage = page;
    notifyListeners();
  }

  void registerAuthListener() {
    env.client.auth.onAuthStateChange((event, session) {
      switch (event) {
        case AuthChangeEvent.signedIn:
          break;
        case AuthChangeEvent.signedOut:
          break;
        case AuthChangeEvent.userUpdated:
          break;
        case AuthChangeEvent.passwordRecovery:
          break;
      }
      notifyListeners();
    });
  }

  Future<void> openStudy(String studyId, {DesignerPage page = DesignerPage.about}) async {
    draftStudy = await SupabaseQuery.getById<Study>(studyId);
    _selectedStudyId = studyId;
    _selectedDesignerPage = page;
    notifyListeners();
  }

  Future<void> openNewStudy(Study study) async {
    draftStudy = study;
    _selectedStudyId = study.id;
    notifyListeners();
  }

  void closeDesigner() {
    _selectedStudyId = null;
    draftStudy = null;
    _selectedDesignerPage = DesignerPage.about;
    reloadResearcherDashboard();
    notifyListeners();
  }

  void reloadStudies() {
    reloadResearcherDashboard();
    notifyListeners();
  }
}
