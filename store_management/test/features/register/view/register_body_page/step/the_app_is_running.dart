import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

import '../../../../../helpers/pump_app.dart';

Future<void> theAppIsRunning(WidgetTester tester, RegisterBloc registerBloc,
    AuthenticationRepository authenticationRepository) async {
  Widget buildSubject() {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider.value(
        value: registerBloc,
        child: const RegisterBodyPage(),
      ),
    );
  }

  await tester.pumpApp(buildSubject());
}
