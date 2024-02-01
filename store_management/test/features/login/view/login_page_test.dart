// import 'package:bloc_test/bloc_test.dart';
// import 'package:coffee_restaurant/coffee_restaurant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../helpers/helpers.dart';

// class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
//     implements LoginBloc {}

// class MockAuthenticationRepository extends Mock
//     implements AuthenticationRepository {}

// void main() {
//   late LoginBloc loginBloc;
//   late AuthenticationRepository authenticationRepository;

//   setUp(() {
//     loginBloc = MockLoginBloc();
//     authenticationRepository = MockAuthenticationRepository();
//     when(() => loginBloc.state).thenReturn(const LoginState());
//   });

//   Widget buildSubject() {
//     return RepositoryProvider.value(
//       value: authenticationRepository,
//       child: BlocProvider.value(
//         value: loginBloc,
//         child: const LoginPage(),
//       ),
//     );
//   }

//   group('LoginPage', () {
//     testWidgets(
//       "renders the correct widgets",
//       (WidgetTester tester) async {
//         when(() => loginBloc.state).thenReturn(const LoginState());
//         await tester.pumpApp(buildSubject());
//         expect(find.byType(LoginPage), findsOneWidget);
//         expect(find.byType(LoginForm), findsOneWidget);
//       },
//     );
//   });
// }
