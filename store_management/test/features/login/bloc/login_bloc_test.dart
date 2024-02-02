import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_management/store_management.dart';

import '../../../helpers/mock_firebase.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthenticationRepository authenticationRepository;

  const String mockUserName = 'username';
  const String mockPassword = 'password';
  const String mockEmail = 'email@gmail.com';
  const bool mockIsRemember = true;

  TestWidgetsFlutterBinding.ensureInitialized();

  // In order to call firebase test (call log), I need to mock channel firebase
  setupFirebaseAnalyticsMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
    SharedPreferences.setMockInitialValues({});
  });

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
  });
  group('LoginBloc', () {
    test('Initial state is LoginState', () {
      final LoginBloc loginBloc =
          LoginBloc(authenticationRepository: authenticationRepository);
      expect(loginBloc.state, const LoginState());
    });

    blocTest<LoginBloc, LoginState>(
      'Emit the username when LoginUsernameChanged is added',
      build: () =>
          LoginBloc(authenticationRepository: authenticationRepository),
      act: (LoginBloc bloc) =>
          bloc.add(const LoginUsernameChanged(mockUserName)),
      expect: () => [
        const LoginState(username: Username.dirty(value: mockUserName)),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'Emit the password and status is invalid when LoginPasswordChanged is added',
      build: () =>
          LoginBloc(authenticationRepository: authenticationRepository),
      act: (LoginBloc bloc) =>
          bloc.add(const LoginPasswordChanged(mockPassword)),
      expect: () => [
        const LoginState(
          status: FormzSubmissionStatus.failure,
          password: Password.dirty(value: mockPassword),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'Emit the password and status is valid when LoginPasswordChanged is added and email is initialized',
      build: () =>
          LoginBloc(authenticationRepository: authenticationRepository),
      seed: () => LoginState(email: Email.dirty(value: mockEmail)),
      act: (LoginBloc bloc) =>
          bloc.add(const LoginPasswordChanged(mockPassword)),
      expect: () => [
        LoginState(
          status: FormzSubmissionStatus.success,
          password: const Password.dirty(value: mockPassword),
          email: Email.dirty(value: mockEmail),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'Emit the email and status is invalid when LoginEmailChanged is added and password is not initialized',
      build: () =>
          LoginBloc(authenticationRepository: authenticationRepository),
      act: (LoginBloc bloc) => bloc.add(const LoginEmailChanged(mockEmail)),
      expect: () => [
        LoginState(
          status: FormzSubmissionStatus.failure,
          email: Email.dirty(value: mockEmail),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'Emit the email and status is valid when LoginEmailChanged is added and password is initialized',
      build: () =>
          LoginBloc(authenticationRepository: authenticationRepository),
      seed: () =>
          const LoginState(password: Password.dirty(value: mockPassword)),
      act: (LoginBloc bloc) => bloc.add(const LoginEmailChanged(mockEmail)),
      expect: () => [
        LoginState(
          status: FormzSubmissionStatus.success,
          email: Email.dirty(value: mockEmail),
          password: const Password.dirty(value: mockPassword),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'Emit the isRememberMe when LoginRememberMeChanged is added',
      build: () =>
          LoginBloc(authenticationRepository: authenticationRepository),
      act: (LoginBloc bloc) =>
          bloc.add(const LoginRememberMeChanged(mockIsRemember)),
      expect: () => [
        const LoginState(
          isRememberMe: mockIsRemember,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'Emit the isRememberMe when LoginRememberMeChanged is added',
      build: () =>
          LoginBloc(authenticationRepository: authenticationRepository),
      act: (LoginBloc bloc) =>
          bloc.add(const LoginRememberMeChanged(mockIsRemember)),
      expect: () => [
        const LoginState(
          isRememberMe: mockIsRemember,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'Emit the loginProgress is unknown when LoginForgotPassword is added and email is not initialized',
      build: () =>
          LoginBloc(authenticationRepository: authenticationRepository),
      act: (LoginBloc bloc) => bloc.add(const LoginForgotPassword()),
      expect: () => [
        const LoginState(
          loginProgress: LoginProgress.forgotPasswordInProgress,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
        'Emit the loginProgress is unknown when LoginForgotPassword is added and email is initialized',
        build: () =>
            LoginBloc(authenticationRepository: authenticationRepository),
        seed: () => LoginState(email: Email.dirty(value: mockEmail)),
        setUp: () {
          when(() => authenticationRepository.forgotPasswordRequest(any()))
              .thenAnswer((_) async => true);
        },
        act: (LoginBloc bloc) => bloc.add(const LoginForgotPassword()),
        expect: () => [
              LoginState(
                email: Email.dirty(value: mockEmail),
                loginProgress: LoginProgress.forgotPasswordInProgress,
              ),
              LoginState(
                email: Email.dirty(value: mockEmail),
                loginProgress: LoginProgress.unknown,
              ),
            ],
        verify: ((bloc) {
          verify(
            () => authenticationRepository.forgotPasswordRequest(mockEmail),
          ).called(1);
        }));
  });

  blocTest<LoginBloc, LoginState>(
    'No emit any state when LoginSubmitted is added but email, password and status are not initialized',
    build: () => LoginBloc(authenticationRepository: authenticationRepository),
    // seed: () => LoginState(password: Password.dirty(value: mockPassword)),
    act: (LoginBloc bloc) => bloc.add(const LoginSubmitted()),
    expect: () => [],
  );

  blocTest<LoginBloc, LoginState>(
    'Emit the correct status when LoginSubmitted is added and email, password and status are initialized',
    build: () => LoginBloc(authenticationRepository: authenticationRepository),
    setUp: () {
      when(
        () => authenticationRepository.logIn(
            email: mockEmail, password: mockPassword),
      ).thenAnswer((_) async => true);
    },
    seed: () => LoginState(
      email: Email.dirty(value: mockEmail),
      password: const Password.dirty(value: mockPassword),
      status: FormzSubmissionStatus.failure,
    ),
    act: (LoginBloc bloc) => bloc.add(const LoginSubmitted()),
    expect: () => [
      LoginState(
        email: Email.dirty(value: mockEmail),
        password: const Password.dirty(
          value: mockPassword,
        ),
        status: FormzSubmissionStatus.inProgress,
        loginProgress: LoginProgress.loginInProgress,
      ),
      LoginState(
        email: Email.dirty(value: mockEmail),
        password: const Password.dirty(
          value: mockPassword,
        ),
        status: FormzSubmissionStatus.success,
        loginProgress: LoginProgress.loginSuccess,
      )
    ],
  );
}
