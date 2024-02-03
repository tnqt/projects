import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_management/store_management.dart';
import '../../../helpers/pump_app.dart';


class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  late LoginBloc loginBloc;

  setUp(() {
    loginBloc = MockLoginBloc();
    when(
      () => loginBloc.state,
    ).thenReturn(const LoginState());
  });

  Widget buildSubject() {
    return BlocProvider.value(
      value: loginBloc,
      child: const LoginWithGoogleAccountWidget(),
    );
  }

  group('LoginWithGoogleAccountWidget', (){
    testWidgets(
      "renders the correct widget",
      (WidgetTester tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(LoginWithGoogleAccountWidget), findsOneWidget);
        expect(find.text('Google'), findsOneWidget);

        final itemFinder = find.byType(GestureDetector);
        expect(itemFinder, findsOneWidget);
        final GestureDetector gestureDetectorWidget = tester.widget(itemFinder);
        expect(gestureDetectorWidget.behavior, HitTestBehavior.translucent);
      },
    );

    testWidgets(
      "fires the correct event when \"Google\" button is tapped",
      (WidgetTester tester) async {
        await tester.pumpApp(buildSubject());

        final itemFinder = find.text('Google');
        expect(itemFinder, findsOneWidget);
        await tester.tap(itemFinder);
        verify(() => loginBloc.add(const LoginWithGoogleAccount()),).called(1);
      },
    );
  });
}
