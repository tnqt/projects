import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_management/store_management.dart';

class RouteNames {
  RouteNames._();
  static const rootView = "rootView";
  static const home = "homeScreen";
  static const splash = "splashScreen";
  static const loadingPage = "loadingPage";
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
  initialLocation: "/root",
  routes: [
    GoRoute(
      path:
          '/root', // In order to run need to have the first route the same initialLocation
      name: RouteNames.rootView,
      builder: (context, state) => const SuperAppRootView(),
    ),
    GoRoute(
      path:
          '/splash', // In order to run need to have the first route the same initialLocation
      name: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
    // GoRoute(
    //   path: '/main', // In order to run need to have the first route the same
    //   name: RouteNames.home,
    //   builder: (context, state) => const HomePage(),
    //   // routes: MiniAppManager.getRoutes(),
    // ),
    GoRoute(
      path: '/loading',
      name: RouteNames.loadingPage,
      builder: (context, state) => const LoadingPage(),
    ),
    GoRoute(
      path: '/main/login_page',
      name: RouteNames.loginPage,
      builder: (context, state) => const LoginPage(),
    ),
    ...MiniAppManager
        .getRoutes(), // In order navigate to sub module needs to add this line to get route of sub module
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
