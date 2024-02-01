import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

void main() {
  group('LoginEvent', () {
    group('LoginUsernameChanged', () {
      const mockUserName = 'Thao Nguyen';
      test('supports value comparison', () {
        expect(const LoginUsernameChanged(mockUserName),
            const LoginUsernameChanged(mockUserName));
      });

      test('Props are correct', () {
        expect(const LoginUsernameChanged(mockUserName).props,
            equals(<Object?>[mockUserName]));
      });
    });

    group('LoginEmailChanged', () {
      const mockEmail = 'tn@gmail.com';
      test('supports value comparison', () {
        expect(const LoginEmailChanged(mockEmail), const LoginEmailChanged(mockEmail));
      });

      test('Props are correct', () {
        expect(
            const LoginEmailChanged(mockEmail).props, equals(<Object?>[mockEmail]));
      });
    });

    group('LoginPasswordChanged', () {
      const mockPassword = '12345678';
      test('supports value comparison', () {
        expect(const LoginPasswordChanged(mockPassword),
            const LoginPasswordChanged(mockPassword));
      });

      test('Props are correct', () {
        expect(const LoginPasswordChanged(mockPassword).props,
            equals(<Object?>[mockPassword]));
      });
    });
    group('LoginPasswordChanged', () {
      const mockPassword = '12345678';
      test('supports value comparison', () {
        expect(const LoginPasswordChanged(mockPassword),
            const LoginPasswordChanged(mockPassword));
      });

      test('Props are correct', () {
        expect(const LoginPasswordChanged(mockPassword).props,
            equals(<Object?>[mockPassword]));
      });
    });

    group('LoginSubmitted', () {
      test('supports value comparison', () {
        expect(const LoginSubmitted(), const LoginSubmitted());
      });

      test('Props are correct', () {
        expect(const LoginSubmitted().props, equals(<Object?>[]));
      });
    });
    group('LoginRememberMeChanged', () {
      const mockIsRemember = true;
      test('supports value comparison', () {
        expect(const LoginRememberMeChanged(mockIsRemember),
            const LoginRememberMeChanged(mockIsRemember));
      });

      test('Props are correct', () {
        expect(const LoginRememberMeChanged(mockIsRemember).props,
            equals(<Object?>[mockIsRemember]));
      });
    });
    group('LoginForgotPassword', () {
      test('supports value comparison', () {
        expect(const LoginForgotPassword(), const LoginForgotPassword());
      });

      test('Props are correct', () {
        expect(const LoginForgotPassword().props, equals(<Object?>[]));
      });
    });

    group('LoginWithGoogleAccount', () {
      test('supports value comparison', () {
        expect(const LoginWithGoogleAccount(), const LoginWithGoogleAccount());
      });

      test('Props are correct', () {
        expect(const LoginWithGoogleAccount().props, equals(<Object?>[]));
      });
    });
  });
}
