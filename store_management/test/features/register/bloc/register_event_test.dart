import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

void main() {
  group('RegisterEvent', () {
    group('RegisterEmailChanged', () {
      const mockEmail = 'a@gmail.com';
      test('supports value comparison', () {
        expect(const RegisterEmailChanged(mockEmail),
            const RegisterEmailChanged(mockEmail));
      });

      test('Props are correct', () {
        expect(const RegisterEmailChanged(mockEmail).props,
            equals(<Object?>[mockEmail]));
      });
    });

    group('RegisterUsernameChanged', () {
      const mockUserName = 'Thao Nguyen';
      test('supports value comparison', () {
        expect(const RegisterUsernameChanged(mockUserName),
            const RegisterUsernameChanged(mockUserName));
      });

      test('Props are correct', () {
        expect(const RegisterUsernameChanged(mockUserName).props,
            equals(<Object?>[mockUserName]));
      });
    });

    group('RegisterPhoneChanged', () {
      const mockPhoneNumber = '0355240171';
      test('supports value comparison', () {
        expect(const RegisterPhoneChanged(mockPhoneNumber),
            const RegisterPhoneChanged(mockPhoneNumber));
      });

      test('Props are correct', () {
        expect(const RegisterPhoneChanged(mockPhoneNumber).props,
            equals(<Object?>[mockPhoneNumber]));
      });
    });

    group('RegisterPasswordChanged', () {
      const mockPassword = '0355240171';
      test('supports value comparison', () {
        expect(const RegisterPasswordChanged(mockPassword),
            const RegisterPasswordChanged(mockPassword));
      });

      test('Props are correct', () {
        expect(const RegisterPasswordChanged(mockPassword).props,
            equals(<Object?>[mockPassword]));
      });
    });

    group('RegisterSubmitted', () {
      test('supports value comparison', () {
        expect(const RegisterSubmitted(),
            const RegisterSubmitted());
      });

      test('Props are correct', () {
        expect(const RegisterSubmitted().props,
            equals(<Object?>[]));
      });
    });
  });
}
