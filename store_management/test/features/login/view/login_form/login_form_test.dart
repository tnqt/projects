// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_management/store_management.dart';

import '../../../../helpers/pump_app.dart';
import './step/the_app_is_running.dart';
import './step/i_see_login_form.dart';
import 'step/i_see_text.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  late LoginBloc loginBloc;
  setUp(() {
    loginBloc = MockLoginBloc();

    when(() => loginBloc.state).thenReturn(const LoginState());
  });

  tearDown(() {
    loginBloc.close();
  });

  group('''Login Form''', () {
    testWidgets('''Login Form just started''', (tester) async {
      await theAppIsRunning(tester, loginBloc);
      await iSeeLoginForm(tester);
      await iSeeText(tester,
          'Enter your email and password to access \n your account or create an account');
      await iSeeText(tester, 'Remember me');
      await iSeeText(tester, '~ or continue with ~');
      await iSeeText(tester, 'Forgot password?');
      await iSeeText(tester, 'Login');
    });
  });
}
