// import 'package:coffee_restaurant/coffee_restaurant.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   const mockUsername = 'mockUsername';
//   group('Username', () {
//     group('constructors', () {
//       test('pure creates correct instance', () {
//         const username = Username.pure();
//         expect(username.value, '');
//         expect(username.pure, true);
//       });

//       test('dirty creates correct instance', () {
//         const username = Username.dirty(value: mockUsername);
//         expect(username.value, mockUsername);
//         expect(username.pure, false);
//       });
//     });

//     group('validator', () {
//       test('returns empty error when username is empty', () {
//         expect(
//           const Username.dirty().error,
//           UsernameValidationError.empty,
//         );
//       });

//       test('is valid when username is not empty', () {
//         expect(
//           const Username.dirty(value: mockUsername).error,
//           isNull,
//         );
//       });
//     });
//   });
// }
