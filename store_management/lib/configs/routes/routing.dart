import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_management/store_management.dart';

class RouteNames {
  RouteNames._();
  static const home = "home";
  static const loginPage = "loginPage";
  static const myRestaurant = "myRestaurant";
  static const managementPage = "pageOrderManagement";
  static const reservationManagementPage = "reservationManagementPage";
  static const reservationForm = "reservationForm";
  static const successReservationForm = "successReservationForm";
  static const searchForLocationPage = "searchForLocationPage";
  static const searchForLocationMapPage = "searchForLocationMapPage";
  static const purchaseVoucher = "purchaseVoucher";
  static const mealsCatPage = "mealsCatPage";
  static const transactionVoucher = "transactionVoucher";
}



final routerConfig = GoRouter(
  initialLocation: "/main",
  routes: [
    GoRoute(
      path: '/main',
      name: RouteNames.home,
      builder: (context, state) => const SlashPage(),
      // routes: MiniAppManager.getRoutes(),
    ),
    GoRoute(
      path: '/main/login_page',
      name: RouteNames.loginPage,
      builder: (context, state) => const LoginPage(),
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
