import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:product/product.dart';
import 'package:shared_module/shared_module.dart';

List<MiniApp> miniApps = [
  SharedModuleApp(),
  HomeApp(),
  ProductApp()
  // BookingApp(),
  // EcommerceApp(),
  // FoodApp(),
  // SocialApp(),
  // TravelAssistantApp(),
  // OTAMiniApp(),
  // PaymentGateApp(),
  // LiveStreamApp()
];

class MiniAppManager {
  static List<dynamic> createBlocProviders() {
    return _flattenApp((app) => app.createBlocProviders());
  }

  static void registerAppDelegates(AppDelegates appDelegates) {
    for (final app in miniApps) {
      app.registerAppDelegates(appDelegates);
    }
  }

  static List<LocalizationsDelegate> getLocalizationsDelegates() {
    return _flattenApp((app) => app.localizationsDelegates);
  }

  static List<RouteBase> getRoutes() {
    return _flattenApp((app) => app.routes);
  }

  static List<T> _flattenApp<T>(Iterable<T> Function(MiniApp app) getter) {
    final List<T> result = [];
    for (final app in miniApps) {
      result.addAll(getter(app));
    }
    return result;
  }
}
