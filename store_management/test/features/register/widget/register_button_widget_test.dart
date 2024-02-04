import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

import '../../../helpers/pump_app.dart';


class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  const String mockEmail = 'email@gmail.com';
  const String mockPassword = 'password';

  late RegisterBloc registerBloc;
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    registerBloc = MockRegisterBloc();
    authenticationRepository = MockAuthenticationRepository();
    when(
      () => registerBloc.state,
    ).thenReturn(const RegisterState());

    when(
      () =>
          authenticationRepository.mailRegisterRequest(mockEmail, mockPassword),
    ).thenAnswer((_) async => {});
  });
  group('RegisterButtonWidget', () {
    Widget buildSubject() {
      return RepositoryProvider.value(
        value: authenticationRepository,
        child: BlocProvider.value(
          value: registerBloc,
          child: const RegisterButtonWidget(),
        ),
      );
    }

    testWidgets(
      "renders the correct widget",
      (WidgetTester tester) async {
        await tester.pumpApp(buildSubject());

        expect(find.byType(RegisterButtonWidget), findsOneWidget);
        expect(find.text('Register'), findsOneWidget);
      },
    );

    testWidgets(
      "fires the correct event when register is tapped",
      (WidgetTester tester) async {
        await tester.pumpApp(buildSubject());

        final itemFinder = find.text('Register');
        expect(itemFinder, findsOneWidget);
        await tester.tap(itemFinder);
        verify(
          () => registerBloc.add(const RegisterSubmitted()),
        ).called(1);
      },
    );
  });
}
