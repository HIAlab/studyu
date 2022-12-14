import 'package:flutter/material.dart';
import 'package:studyou_core/models/study/studies.dart';

abstract class GenericSection extends StatelessWidget {
  final ParseUserStudy study;
  final GestureTapCallback onTap;

  const GenericSection(this.study, {this.onTap});

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) => Card(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: buildContent(context),
          ),
        ),
      );
}
