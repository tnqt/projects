// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store_management/bootstrap.dart';
import 'package:store_management/firebase_options.dart';
import 'package:store_management/store_management.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  await _firebaseConfiguration();

  final appConfig = await configureAppWithFlavor();

  bootstrap(appConfig: appConfig);
}

Future<void> _firebaseConfiguration() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<AppConfig> configureAppWithFlavor() async {
  final flavor = await NativeFlavors.getFlavor();
  switch (flavor) {
    case Environment.development:
      return AppDevelopmentConfiguration();
    case Environment.staging:
      return AppStagingConfiguration();
    case Environment.production:
      return AppProductionConfiguration();
    default:
      return AppDevelopmentConfiguration();
  }
}
