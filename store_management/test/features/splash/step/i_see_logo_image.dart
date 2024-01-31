import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Example: When I see {'image_path'} image
Future<void> iSeeLogoImage(
  WidgetTester tester,
) async {
  final itemFinder = find.byKey(const Key('BoxDecorationWithSplashPage'));
  expect(itemFinder, findsOneWidget);

  // Test decoration
  final Container containerWidget = tester.widget(itemFinder);
  final BoxDecoration expectedBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    border: Border.all(
      color: const Color.fromARGB(255, 163, 233, 166),
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0xFF66BB6A),
        blurRadius: 96,
      ),
    ],
    image: const DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('assets/images/logo.png'),
    ),
  );
  expect(containerWidget.decoration, expectedBoxDecoration);
}
