import 'package:flutter/material.dart';
import 'package:studyu_designer_v2/localization/string_hardcoded.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...'.hardcoded),
      ),
    );
  }
}