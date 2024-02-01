// import 'package:bloc_test/bloc_test.dart';
// import 'package:coffee_restaurant/coffee_restaurant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../helpers/helpers.dart';

// class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
//     implements LoginBloc {}

// void main() {
//   late LoginBloc loginBloc;

//   setUp(() {
//     loginBloc = MockLoginBloc();

//     when(() => loginBloc.state).thenReturn(const LoginState());
//   });

//   tearDown(() {
//     loginBloc.close();
//   });

//   // Future<void> widgetTester(String test, Function callBack) async {
//   //   print(test);
//   //   callBack.call();
//   // }

//   group('LoginForm', () {
//     Widget buildSubject() {
//       return BlocProvider.value(
//         value: loginBloc,
//         child: const LoginForm(),
//       );
//     }


//     testWidgets(
//       "renders the correct widgets",
//       (WidgetTester tester) async {
//         // await tester.pumpWidget(MaterialApp(
//         //   localizationsDelegates: const [
//         //     AppLocalization.delegate,
//         //     GlobalCupertinoLocalizations.delegate,
//         //     GlobalMaterialLocalizations.delegate,
//         //     GlobalWidgetsLocalizations.delegate,
//         //   ],
//         //   supportedLocales: const <Locale>[
//         //     Locale('vi', 'VietNam'),
//         //     Locale('en', 'USA'),
//         //   ],
//         //   locale: const Locale('en', 'USA'),
//         //   home: buildSubject(),
//         // ));

//         // await tester.pumpAndSettle();

//         await tester.pumpApp(buildSubject());

//         expect(find.byType(LoginForm), findsOneWidget);
//         expect(find.byType(AppLogoWidget), findsOneWidget);
//         expect(find.byType(LoginInstructionWidget), findsOneWidget);
//         expect(find.byType(CustomEmailInputWidget), findsOneWidget);
//         expect(find.byType(CustomPasswordInputWidget), findsOneWidget);
//         expect(find.byType(RememberMeWidget), findsOneWidget);
//         expect(find.byType(LoginButtonWidget), findsOneWidget);
//         expect(find.byType(ForgotPasswordWidget), findsOneWidget);
//         expect(find.byType(LoginWithGoogleAccountWidget), findsOneWidget);
//         expect(find.byType(RegisterAccountWidget), findsOneWidget);

//         expect(find.text('~ or continue with ~'), findsOneWidget);
//       },
//     );

//     testWidgets(
//       "renders the correct AppLogo widget",
//       (WidgetTester tester) async {
//         await tester.pumpApp(buildSubject());

//         expect(find.image(const AssetImage('assets/images/logo.png')),
//             findsOneWidget);
//         expect(find.text('Thao Nguyen'), findsOneWidget);
//       },
//     );

//     testWidgets(
//       "renders the correct LoginInstruction widget",
//       (WidgetTester tester) async {
      
//         await tester.pumpApp(buildSubject());

//         final itemFinder1 = find.text('login_your_account');
//         expect(itemFinder1, findsOneWidget);
//         final Text textWidget1 = tester.widget(itemFinder1);
//         expect(
//             textWidget1.style,
//             const TextStyle(
//               fontFamily: Constant.appFontFamily,
//               fontWeight: FontWeight.w800,
//               fontSize: 17,
//               color: Colors.black,
//             ));

//         final itemFinder2 = find.text('login_msg');
//         expect(itemFinder2, findsOneWidget);
//         final Text textWidget2 = tester.widget(itemFinder2);
//         expect(
//           textWidget2.style,
//           TextStyle(
//             fontFamily: Constant.appFontFamily,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//             color: Colors.grey[600],
//           ),
//         );
//         expect(textWidget2.textAlign, TextAlign.center);

//         expect(itemFinder2, findsOneWidget);
//       },
//     );
//   });
// }
