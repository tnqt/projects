// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   const mockPassword = 'mockPassword';
//   group('Password', () {
//     group('Constructors', () {
//       test('Pure creates correct instance', () {
//         const password = Password.pure();
//         expect(password.value, '');
//         expect(password.pure, true);
//       });

//       test('Dirty creates correct instance', () {
//         const password = Password.dirty(value: mockPassword);
//         expect(password.value, mockPassword);
//         expect(password.pure, false);
//       });
//     });

//     group('Validator', () {
//       test('Returns empty error when password is empty', () {
//         expect(const Password.dirty().error, PasswordValidationError.empty);
//       });

//       test('Is valid when password is not empty', () {
//         expect(const Password.dirty(value: mockPassword).error, isNull);
//       });
//     });
//   });
// }
