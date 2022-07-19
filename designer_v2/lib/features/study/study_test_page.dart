import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studyu_designer_v2/routing/router.dart';

class StudyTestScreen extends StatelessWidget {
  const StudyTestScreen(this.studyId, {Key? key}) : super(key: key);

  final String studyId;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Test study: $studyId"),
          TextButton(
              onPressed: () => context.goNamed(RouterPage.studyRecruit.id, params: {"studyId": studyId}),
              child: Text("Go to recruit")
          ),
        ],
      )
    );
  }
}
