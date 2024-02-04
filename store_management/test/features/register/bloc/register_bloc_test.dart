import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  const String mockUserName = 'username';
  const String mockPassword = 'password';
  const String mockPhoneNumber = '012345678';
  const String mockEmail = 'email@gmail.com';

  late AuthenticationRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
  });

  group('RegisterBloc', () {
    test('Initial state is RegisterState', () {
      final RegisterBloc registerBloc =
          RegisterBloc(authenticationRepository: authenticationRepository);
      expect(registerBloc.state, const RegisterState());
    });

    blocTest<RegisterBloc, RegisterState>(
      'emit the email and status is invalid when RegisterEmailChanged is added',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      act: (bloc) => bloc.add(const RegisterEmailChanged(mockEmail)),
      expect: () => [
        const RegisterState(
          email: Email.dirty(
            value: mockEmail,
          ),
          status: FormzSubmissionStatus.failure,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emit the email and status is valid when RegisterEmailChanged is added'
      'and user name, phone number and password are initialized',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      seed: () => const RegisterState(
        username: Username.dirty(value: mockUserName),
        phoneNumber: PhoneNumber.dirty(value: mockPhoneNumber),
        password: Password.dirty(value: mockPassword),
      ),
      act: (bloc) => bloc.add(const RegisterEmailChanged(mockEmail)),
      expect: () => [
        const RegisterState(
          email: Email.dirty(
            value: mockEmail,
          ),
          status: FormzSubmissionStatus.success,
          username: Username.dirty(value: mockUserName),
          phoneNumber: PhoneNumber.dirty(value: mockPhoneNumber),
          password: Password.dirty(value: mockPassword),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emit the user name and status is invalid when RegisterUsernameChanged is added',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      act: (bloc) => bloc.add(const RegisterUsernameChanged(mockUserName)),
      expect: () => [
        const RegisterState(
          username: Username.dirty(
            value: mockUserName,
          ),
          status: FormzSubmissionStatus.failure,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emit the user name and status is valid when RegisterEmailChanged is added'
      'and email, phone number and password are initialized',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      seed: () => const RegisterState(
        email: Email.dirty(value: mockEmail),
        phoneNumber: PhoneNumber.dirty(value: mockPhoneNumber),
        password: Password.dirty(value: mockPassword),
      ),
      act: (bloc) => bloc.add(const RegisterUsernameChanged(mockUserName)),
      expect: () => [
        const RegisterState(
          email: Email.dirty(
            value: mockEmail,
          ),
          status: FormzSubmissionStatus.success,
          username: Username.dirty(value: mockUserName),
          phoneNumber: PhoneNumber.dirty(value: mockPhoneNumber),
          password: Password.dirty(value: mockPassword),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emit the phone number and status is invalid when RegisterPhoneChanged is added',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      act: (bloc) => bloc.add(const RegisterPhoneChanged(mockPhoneNumber)),
      expect: () => [
        const RegisterState(
          phoneNumber: PhoneNumber.dirty(
            value: mockPhoneNumber,
          ),
          status: FormzSubmissionStatus.failure,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emit the phone number and status is valid when RegisterPhoneChanged is added'
      'and email, user name and password are initialized',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      seed: () => const RegisterState(
        email: Email.dirty(value: mockEmail),
        username: Username.dirty(value: mockUserName),
        password: Password.dirty(value: mockPassword),
      ),
      act: (bloc) => bloc.add(const RegisterPhoneChanged(mockPhoneNumber)),
      expect: () => [
        const RegisterState(
          email: Email.dirty(
            value: mockEmail,
          ),
          status: FormzSubmissionStatus.success,
          username: Username.dirty(value: mockUserName),
          phoneNumber: PhoneNumber.dirty(value: mockPhoneNumber),
          password: Password.dirty(value: mockPassword),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emit the password and status is invalid when RegisterPasswordChanged is added',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      act: (bloc) => bloc.add(const RegisterPasswordChanged(mockPassword)),
      expect: () => [
        const RegisterState(
          password: Password.dirty(
            value: mockPassword,
          ),
          status: FormzSubmissionStatus.failure,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emit the password and status is valid when RegisterPasswordChanged is added'
      'and email, user name and phone number are initialized',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      seed: () => const RegisterState(
        email: Email.dirty(value: mockEmail),
        username: Username.dirty(value: mockUserName),
        phoneNumber: PhoneNumber.dirty(value: mockPhoneNumber),
      ),
      act: (bloc) => bloc.add(const RegisterPasswordChanged(mockPassword)),
      expect: () => [
        const RegisterState(
          email: Email.dirty(
            value: mockEmail,
          ),
          status: FormzSubmissionStatus.success,
          username: Username.dirty(value: mockUserName),
          phoneNumber: PhoneNumber.dirty(value: mockPhoneNumber),
          password: Password.dirty(value: mockPassword),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits the correct status when RegisterSubmitted is added'
      'and email, password are initialized',
      build: () => RegisterBloc(
        authenticationRepository: authenticationRepository,
      ),
      setUp: () {
        when(
          () => authenticationRepository.mailRegisterRequest(
              mockEmail, mockPassword),
        ).thenAnswer((_) async => {});
      },
      seed: () => const RegisterState(
        email: Email.dirty(
          value: mockEmail,
        ),
        password: Password.dirty(value: mockPassword),
        // username: Username.dirty(value: mockUserName),
        // phoneNumber: PhoneNumber.dirty(value: mockPhoneNumber),
        status: FormzSubmissionStatus.success,
      ),
      act: (bloc) => bloc.add(const RegisterSubmitted()),
      expect: () => [
        const RegisterState(
          email: Email.dirty(value: mockEmail),
          password: Password.dirty(
            value: mockPassword,
          ),
          status: FormzSubmissionStatus.inProgress,
        ),
        const RegisterState(
          email: Email.dirty(value: mockEmail),
          password: Password.dirty(
            value: mockPassword,
          ),
          status: FormzSubmissionStatus.success,
        )
      ],
    );
  });
}
