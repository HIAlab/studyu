import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'study_details.g.dart';

@JsonSerializable()
class StudyDetailsBase {
  Questionnaire questionnaire;
  List<EligibilityCriterion> eligibility;
  List<ConsentItem> consent;
  InterventionSet interventionSet;
  List<Observation> observations;
  StudySchedule schedule;
  ReportSpecification reportSpecification;
  List<StudyResult> results;

  StudyDetailsBase();

  StudyDetailsBase.designerDefault()
      : interventionSet = InterventionSet.designerDefault(),
        questionnaire = Questionnaire.designerDefault(),
        eligibility = [],
        observations = [],
        consent = [],
        schedule = StudySchedule.designerDefault(),
        reportSpecification = ReportSpecification.designerDefault(),
        results = [];

  factory StudyDetailsBase.fromJson(Map<String, dynamic> json) => _$StudyDetailsBaseFromJson(json);
  Map<String, dynamic> toJson() => _$StudyDetailsBaseToJson(this);
}

extension StudyDetailsExtension on StudyDetailsBase {
  StudyDetailsBase toBase() {
    return StudyDetailsBase()
      ..questionnaire = questionnaire
      ..eligibility = eligibility
      ..consent = consent
      ..interventionSet = interventionSet
      ..observations = observations
      ..schedule = schedule
      ..reportSpecification = reportSpecification
      ..results = results;
  }
}
