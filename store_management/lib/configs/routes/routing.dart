import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_management/store_management.dart';

final routerConfig = GoRouter(
  initialLocation: "/main",
  routes: [
    GoRoute(
      path: '/main',
      name: 'home',
      builder: (context, state) => const HomePage(),
      // routes: MiniAppManager.getRoutes(),
    ),
    ...MiniAppManager.getRoutes(), // In order navigate to sub module needs to add this line to get route of sub module
  ],
  errorBuilder: ((context, state) => const ErrorRouterWidget()),
);

class ErrorRouterWidget extends StatelessWidget {
  const ErrorRouterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Error Router Widget'),
    );
  }
}
