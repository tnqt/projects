import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

void main() {
  const username = Username.pure();
  const email = Email.pure();
  const password = Password.pure();
  const isRememberMe = false;
  const loginProgress = LoginProgress.unknown;

  group('LoginState', () {
    test('supports value comparisons', () {
      expect(const LoginState(), const LoginState());
    });

    test('returns same object when no properties are passed', () {
      expect(const LoginState().copyWith(), const LoginState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const LoginState().copyWith(status: FormzSubmissionStatus.initial),
        const LoginState(),
      );
    });

    test('returns object with updated username when username is passed', () {
      expect(
        const LoginState().copyWith(username: username),
        const LoginState(username: username),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const LoginState().copyWith(email: email),
        const LoginState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const LoginState().copyWith(password: password),
        const LoginState(password: password),
      );
    });

    test('returns object with updated isRememberMe when isRememberMe is passed', () {
      expect(
        const LoginState().copyWith(isRememberMe: isRememberMe),
        const LoginState(isRememberMe: isRememberMe),
      );
    });

    test('returns object with updated loginProgress when loginProgress is passed', () {
      expect(
        const LoginState().copyWith(loginProgress: loginProgress),
        const LoginState(loginProgress: loginProgress),
      );
    });
  });
}
