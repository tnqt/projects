import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

import '../../../helpers/pump_app.dart';


class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  late LoginBloc loginBloc;

  setUp(() {
    loginBloc = MockLoginBloc();
    when(
      () => loginBloc.state,
    ).thenReturn(const LoginState());
  });

  Widget buildSubject() {
    return BlocProvider.value(
      value: loginBloc,
      child: const ForgotPasswordWidget(),
    );
  }

  group('ForgotPasswordWidget', () {
    testWidgets(
      "renders the correct widgets",
      (WidgetTester tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(ForgotPasswordWidget), findsOneWidget);
        expect(find.text('Forgot password?'), findsOneWidget);
        expect(find.byType(CustomSpinkitCircle), findsNothing);
      },
    );

    testWidgets(
      "renders the CustomSpinkitCircle widgets when loginProgress is FORGOT_PASSWORD_IN_PROGRESS",
      (WidgetTester tester) async {
        when(
          () => loginBloc.state,
        ).thenReturn(const LoginState(
          loginProgress: LoginProgress.forgotPasswordInProgress,
        ));
        await tester.pumpApp(buildSubject());

        expect(find.byType(CustomSpinkitCircle), findsOneWidget);
      },
    );

    testWidgets(
      "fires the correct event when \"Forgot password?\" button is tapped",
      (WidgetTester tester) async {
        await tester.pumpApp(buildSubject());
        final itemFinder = find.text('Forgot password?');
        expect(itemFinder, findsOneWidget);
        verifyNever(() => loginBloc.add(const LoginForgotPassword()));

        await tester.tap(itemFinder);
        await tester.pumpAndSettle();
        verify(
          () => loginBloc.add(const LoginForgotPassword()),
        ).called(1);
      },
    );
  });
}
