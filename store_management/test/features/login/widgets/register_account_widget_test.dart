import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

import '../../../helpers/pump_app.dart';

void main() {
  // late MockNavigator navigator;

  // setUpAll(() {
  //   navigator = MockNavigator();
  //   when(navigator.canPop).thenReturn(true);
  //   when(() => navigator.push<void>(any())).thenAnswer((_) async {});
  // });

  Widget buildSubject() {
    // return MockNavigatorProvider(
    //   navigator: navigator,
    //   child: const RegisterAccountWidget(),
    // );
    return const RegisterAccountWidget();
  }

  group('RegisterAccountWidget', () {
    testWidgets(
      "renders the correct widget",
      (WidgetTester tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(RegisterAccountWidget), findsOneWidget);

        // expect(
        //     find.byWidgetPredicate((widget) =>
        //         widget is RichText &&
        //         widget.text.toPlainText() == 'Don\'t have an account? Register'),
        //     findsOneWidget);

        // expect(find.text('Don\'t have an account? Register', findRichText: true), findsOneWidget);
      },
    );

    // testWidgets(
    //   "fires the correct event when button is tapped",
    //   (WidgetTester tester) async {
    //     when(() => navigator.pushNamed(any())).thenAnswer((_) async => null);

    //     await tester.pumpApp(buildSubject());
    //     final itemFinder = find.byType(TextButton);
    //     expect(itemFinder, findsOneWidget);
    //     await tester.tap(itemFinder);
    //     await tester.pumpAndSettle();

    //     verify(
    //       () => navigator.pushNamed(RegisterPage.routeName),
    //     ).called(1);
    //   },
    // );
  });
}
