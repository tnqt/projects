// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_see_splash_page.dart';
import './step/i_see_logo_image.dart';
import './step/i_see_widget.dart';

void main() {
  group('''Splash''', () {
    testWidgets('''The Splash just started''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeSplashPage(tester);
      await iSeeLogoImage(tester);
      await iSeeWidget(tester, LinearProgressIndicator);
    });
  });
}
