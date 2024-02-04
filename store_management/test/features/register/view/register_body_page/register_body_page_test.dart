// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_management/store_management.dart';

import './step/the_app_is_running.dart';
import './step/i_see_register_body_page.dart';
import './step/i_see_logo_image.dart';
import './step/i_see_text.dart';
import './step/i_see_widget.dart';
import './step/i_enter_text_into_text_field.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  const String mockEmail = 'email@gmail.com';
  const String mockPassword = 'password';

  RememberMeModel mockRememberMeModel = RememberMeModel.empty.copyWith(
    isRemember: true,
    email: 'a@gmail.com',
    password: '12345678',
  );

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

  group('''Register Body Page''', () {
    testWidgets('''Register Body Page renders the correct widget''',
        (tester) async {
      await theAppIsRunning(tester, registerBloc, authenticationRepository);
      await iSeeRegisterBodyPage(tester);
      await iSeeLogoImage(tester);
      await iSeeText(tester, 'Thao Nguyen');
      await iSeeText(tester, 'Create An Account');
      await iSeeText(tester,
          'Register with your own active email and new \n password or login your account');
      await iSeeWidget(tester, CustomUserNameInputWidget);
      await iSeeWidget(tester, CustomEmailInputWidget);
      await iSeeWidget(tester, CustomPhoneInputWidget);
      await iSeeWidget(tester, CustomPasswordInputWidget);
      await iSeeWidget(tester, RegisterButtonWidget);
      await iSeeWidget(tester, AlreadyHaveAnAccountWidget);
    });
    testWidgets('''fire the correct event when user text field is input''',
        (tester) async {
      await theAppIsRunning(tester, registerBloc, authenticationRepository);

      await iEnterTextIntoTextField(
          tester: tester,
          key: const Key('CustomUserNameInputWidget'),
          text: 'TN',
          verificationFunction: () {
            verify(() => registerBloc.add(const RegisterUsernameChanged('TN')))
                .called(1);
          });
    });
    testWidgets('''fire the correct event when email text field is input''',
        (tester) async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        Constant.rememberMeInfoLogin: json.encode(mockRememberMeModel.toJson()),
      });

      await theAppIsRunning(tester, registerBloc, authenticationRepository);

      await iEnterTextIntoTextField(
          tester: tester,
          key: const Key('CustomEmailInputWidget'),
          text: 'email@gmail.com',
          verificationFunction: () {
            verify(() => registerBloc.add(const RegisterEmailChanged('TN')))
                .called(1);
          });
    });
    testWidgets('''fire the correct event when phone text field is input''',
        (tester) async {
      await theAppIsRunning(tester, registerBloc, authenticationRepository);
      await iEnterTextIntoTextField(
          tester: tester,
          key: const Key('CustomPhoneInputWidget'),
          text: '0123456789',
          verificationFunction: () {
            verify(() => registerBloc
                .add(const RegisterPhoneChanged('email@gmail.com'))).called(1);
          });
    });
    testWidgets('''fire the correct event when password text field is input''',
        (tester) async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        Constant.rememberMeInfoLogin: json.encode(mockRememberMeModel.toJson()),
      });
      await theAppIsRunning(tester, registerBloc, authenticationRepository);
      await iEnterTextIntoTextField(
          tester: tester,
          key: const Key('CustomPasswordInputWidget'),
          text: 'password',
          verificationFunction: () {
            verify(() =>
                    registerBloc.add(const RegisterPasswordChanged('password')))
                .called(1);
          });
    });
  });
}
