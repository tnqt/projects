import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:store_management/store_management.dart';

import '../../../helpers/pump_app.dart';


void main() {
  late MockNavigator mockNavigator;

  setUp(() {
    mockNavigator = MockNavigator();
  });

  group('AlreadyHaveAnAccountWidget', () {
    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: mockNavigator,
        child: const AlreadyHaveAnAccountWidget(),
      );
    }

    testWidgets(
      "renders the correct widget",
      (WidgetTester tester) async {
        await tester.pumpApp(
          buildSubject(),
        );
        expect(find.byType(AlreadyHaveAnAccountWidget), findsOneWidget);
        expect(find.text('Already have an account? Login', findRichText: true),
            findsOneWidget);
      },
    );

    testWidgets(
      "fires the correct event when button is tapped",
      (WidgetTester tester) async {
        await tester.pumpApp(
          buildSubject(),
        );

        final itemFinder = find.byType(TextButton);
        expect(itemFinder, findsOneWidget);
        await tester.tap(itemFinder);
        verify(
          () => mockNavigator.pop(),
        ).called(1);
      },
    );
  });
}
