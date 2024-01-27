import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

class SlashPage extends StatelessWidget {
  const SlashPage({super.key});

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
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          'Hello World from Thao Nguyen owner',
          style: CustomTextStyle.textStyleDefault,
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
