import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

import '../../../../../helpers/pump_app.dart';

Future<void> theAppIsRunning(WidgetTester tester, LoginBloc loginBloc, AuthenticationRepository authenticationRepository) async {
  Widget buildSubject(LoginBloc loginBloc, AuthenticationRepository authenticationRepository) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider.value(
        value: loginBloc,
        child: const LoginPage(),
      ),
    );
  }

  await tester.pumpApp(buildSubject(loginBloc, authenticationRepository));
}
