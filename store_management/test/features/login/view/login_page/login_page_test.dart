// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

import './step/the_app_is_running.dart';
import '../../../../helpers/mock_navigator.dart';
import 'step/i_see_login_page.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late LoginBloc loginBloc;
  late AuthenticationRepository authenticationRepository;
  late MockGoRouter mockGoRouter;

  setUp(() {
    loginBloc = MockLoginBloc();
    mockGoRouter = MockGoRouter();
    authenticationRepository = MockAuthenticationRepository();

    when(() => loginBloc.state).thenReturn(const LoginState());
  });

  tearDown(() {
    loginBloc.close();
  });

  group('''Login Page''', () {
    testWidgets('''Login Page just started''', (tester) async {
      await theAppIsRunning(tester, mockGoRouter, loginBloc, authenticationRepository);
      await iSeeLoginPage(tester);
    });
  });
}
