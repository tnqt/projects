import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

void main() {
  const email = Email.pure();
  const username = Username.pure();
  const phoneNumber = PhoneNumber.pure();
  const password = Password.pure();

  group('RegisterState', () {
    test('supports value comparisons', () {
      expect(const RegisterState(), const RegisterState());
    });

    test('returns same object when no properties are passed', () {
      expect(const RegisterState().copyWith(), const RegisterState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const RegisterState().copyWith(status: FormzSubmissionStatus.initial),
        const RegisterState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const RegisterState().copyWith(email: email),
        const RegisterState(email: email),
      );
    });

    test('returns object with updated username when username is passed', () {
      expect(
        const RegisterState().copyWith(username: username),
        const RegisterState(username: username),
      );
    });

    test('returns object with updated phoneNumber when phoneNumber is passed', () {
      expect(
        const RegisterState().copyWith(phoneNumber: phoneNumber),
        const RegisterState(phoneNumber: phoneNumber),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const RegisterState().copyWith(password: password),
        const RegisterState(password: password),
      );
    });
  });
}
