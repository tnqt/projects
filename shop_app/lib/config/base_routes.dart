
import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

final routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (_) => const SplashScreen(),
  LoadingPage.routeName: (_) => const LoadingPage(),

  LoginPage.routeName: (_) => const LoginPage(),
  RegisterPage.routeName: (_) => const RegisterPage(),

};
