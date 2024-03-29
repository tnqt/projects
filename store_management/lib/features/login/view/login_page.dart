import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login/login_page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (context) {
              return LoginBloc(
                  authenticationRepository: RepositoryProvider.of<
                      shared_module.AuthenticationRepository>(context));
            },
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
