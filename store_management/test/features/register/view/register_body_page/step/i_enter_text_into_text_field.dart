import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iEnterTextIntoTextField({
  required WidgetTester tester,
  required Key key,
  required String text,
  required Function verificationFunction,
}) async {
  Future<void> checkInputText({
    required Key key,
    required String submittedText,
    required String expectedText,
    required Function verificationFunction,
  }) async {
    return TestAsyncUtils.guard(() async {
      final itemFinder = find.byKey(key);
      expect(itemFinder, findsOneWidget);
      await tester.enterText(itemFinder, submittedText);
      expect(find.text(expectedText), findsOneWidget);
      verificationFunction();
    });
  }

  await checkInputText(
      key: key,
      submittedText: text,
      expectedText: text,
      verificationFunction: () => verificationFunction);
}
