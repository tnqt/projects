import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

import '../../../../../helpers/pump_app.dart';

Future<void> theAppIsRunning(WidgetTester tester, LoginBloc loginBloc) async {
  Widget buildSubject(LoginBloc loginBloc) {
    return BlocProvider.value(
      value: loginBloc,
      child: const LoginForm(),
    );
  }

  await tester.pumpApp(buildSubject(loginBloc));
}
