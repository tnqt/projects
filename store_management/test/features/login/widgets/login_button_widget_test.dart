// import 'package:coffee_restaurant/coffee_restaurant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockingjay/mockingjay.dart';
// import 'package:bloc_test/bloc_test.dart';
// import '../../helpers/helpers.dart';


// class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
//     implements LoginBloc {}

// void main() {
//   late LoginBloc loginBloc;

//   setUp(() {
//     loginBloc = MockLoginBloc();
//     when(
//       () => loginBloc.state,
//     ).thenReturn(const LoginState());
//   });

//   Widget buildSubject() {
//     return BlocProvider.value(
//       value: loginBloc,
//       child: const LoginButtonWidget(),
//     );
//   }

//   group('LoginButtonWidget', (){
//     testWidgets(
//       "renders the correct widget",
//       (WidgetTester tester) async {
//         await tester.pumpApp(buildSubject());

//         expect(find.text('Login'), findsOneWidget);
//       },
//     );

//     testWidgets(
//       "fires the correct event when \"Login\" button is tapped",
//       (WidgetTester tester) async {
//         await tester.pumpApp(buildSubject());

//         final itemFinder = find.text('Login');
//         expect(itemFinder, findsOneWidget);
//         await tester.tap(itemFinder);
//         verify(() => loginBloc.add(const LoginSubmitted()),).called(1);
//       },
//     );
//   });
// }
