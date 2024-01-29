import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

class SuperAppRootView extends StatelessWidget {
  const SuperAppRootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) => authHandler(
            // StoreManagementApp.navigatorKey.currentContext!,
            context,
            state.status,
            state.user,
          ),
        ),
      ],
      child: const SplashPage(),
    );
  }
}
