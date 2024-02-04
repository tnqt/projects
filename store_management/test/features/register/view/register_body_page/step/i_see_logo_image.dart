import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeLogoImage(WidgetTester tester) async {
  expect(
      find.image(const AssetImage('assets/images/logo.png')), findsOneWidget);
}
