// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

import '../../../../helpers/pump_app.dart';
import './step/the_app_is_running.dart';
import 'step/i_see_register_body_page.dart';
import 'step/i_see_register_page.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late LoginBloc loginBloc;
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    loginBloc = MockLoginBloc();
    authenticationRepository = MockAuthenticationRepository();

    when(() => loginBloc.state).thenReturn(const LoginState());
  });

  tearDown(() {
    loginBloc.close();
  });

  group('''Register Page''', () {
    testWidgets('''Register Page just started''', (tester) async {
      await theAppIsRunning(tester, loginBloc, authenticationRepository);
      await iSeeRegisterPage(tester);
      await iSeeRegisterBodyPage(tester);
    });
  });
}
