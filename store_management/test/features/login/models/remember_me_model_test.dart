// import 'package:coffee_restaurant/coffee_restaurant.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('RememberMeModel', () {
//     RememberMeModel createSubject({
//       bool isRemember = true,
//       String email = 'abc@gmail.com',
//       String password = '0123456789',
//     }) {
//       return RememberMeModel(
//         isRemember: isRemember,
//         email: email,
//         password: password,
//       );
//     }

//     group('constructor', () {
//       test('works correctly', () {
//         expect(createSubject, returnsNormally);
//       });
//     });

//     test('supports value equality', () {
//       expect(
//         createSubject(),
//         equals(createSubject()),
//       );
//     });

//     test('props are correct', () {
//       expect(
//         createSubject().props,
//         equals([
//           true,
//           'abc@gmail.com',
//           '0123456789',
//         ]),
//       );
//     });

//     group('copyWith', () {
//       test('returns the same object if not arguments are provided', () {
//         expect(createSubject().copyWith(), equals(createSubject()));
//       });

//       test('retains the old value for every parameter if null is provided', () {
//         expect(
//             createSubject()
//                 .copyWith(isRemember: null, email: null, password: null),
//             equals(createSubject()));
//       });

//       test('replaces every non-null parameter', () {
//         expect(
//             createSubject().copyWith(
//                 isRemember: true, email: 'a@gmail.com', password: '12345678'),
//             equals(createSubject(
//                 isRemember: true, email: 'a@gmail.com', password: '12345678')));
//       });

//       group('fromJson', () {
//         test('works correctly', () {
//           expect(
//               RememberMeModel.fromJson(const <String, dynamic>{
//                 'isRemember': true,
//                 'email': 'abc@gmail.com',
//                 'password': '0123456789'
//               }),
//               equals(createSubject()));
//         });
//       });

//       group('toJson', () {
//         test('works correctly', () {
//           expect(
//               createSubject().toJson(),
//               equals(<String, dynamic>{
//                 'isRemember': true,
//                 'email': 'abc@gmail.com',
//                 'password': '0123456789'
//               }));
//         });
//       });
//     });
//   });
// }
