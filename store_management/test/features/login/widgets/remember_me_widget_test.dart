// import 'dart:convert';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:coffee_restaurant/coffee_restaurant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../helpers/helpers.dart';

// class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
//     implements LoginBloc {}

// void main() {
//   late LoginBloc loginBloc;

//   RememberMeModel mockRememberMeModel = RememberMeModel.empty.copyWith(
//     isRemember: true,
//     email: 'a@gmail.com',
//     password: '12345678',
//   );

//   setUp(() {
//     loginBloc = MockLoginBloc();
//     when(
//       () => loginBloc.state,
//     ).thenReturn(const LoginState());
//   });

//   Widget buildSubject() {
//     return BlocProvider.value(
//       value: loginBloc,
//       child: const RememberMeWidget(),
//     );
//   }

//   group('RememberMeWidget', () {
//     testWidgets(
//       "renders the correct widgets",
//       (WidgetTester tester) async {
//         await tester.pumpApp(buildSubject());
//         expect(find.byType(RememberMeWidget), findsOneWidget);
//         expect(find.text('Remember me'), findsOneWidget);
//         expect(find.byIcon(Icons.radio_button_off_outlined), findsOneWidget);

//         final itemFinder = find.byType(GestureDetector);
//         expect(itemFinder, findsOneWidget);
//         await tester.tap(itemFinder);
//         await tester.pumpAndSettle();
//         // It does not add event in getIsRememberMe
//         verify(
//           () => loginBloc.add(const LoginRememberMeChanged(true)),
//         ).called(1);
//       },
//     );

//     testWidgets(
//       "renders the correct widgets when isRememberMe is mocked to true in sharePreference",
//       (WidgetTester tester) async {
//         SharedPreferences.setMockInitialValues(<String, Object>{
//           Constant.rememberMeInfoLogin:
//               json.encode(mockRememberMeModel.toJson()),
//         });

//         await tester.runAsync(() async {
//           await tester.pumpApp(buildSubject());
//           await tester.pumpAndSettle();
//           expect(find.byType(RememberMeWidget), findsOneWidget);
//           expect(find.text('Remember me'), findsOneWidget);
//           expect(find.byIcon(Icons.radio_button_off_outlined), findsNothing);
//           expect(
//               find.byIcon(Icons.radio_button_checked_outlined), findsOneWidget);

//           final itemFinder = find.byType(GestureDetector);
//           expect(itemFinder, findsOneWidget);
//           await tester.tap(itemFinder);
//           await tester.pumpAndSettle();

//           // This test add both event in getIsRememberMe
//           verify(
//             () => loginBloc.add(const LoginRememberMeChanged(true)),
//           ).called(1);
//           verify(
//             () => loginBloc.add(const LoginRememberMeChanged(false)),
//           ).called(1);
//         });
//       },
//     );
//   });
// }
