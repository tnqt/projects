// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_management/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  // await _firebaseConfiguration();

  // final localStorageApi = LocalStorageStoreApi();
  // final firebaseStorageApi = FirebaseStorageApi();

  await _configFlavor();

  bootstrap(
    // localStorageStoreApi: localStorageApi,
    // firebaseStorageApi: firebaseStorageApi,
  );
}

// Future<void> _firebaseConfiguration() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }


Future<void> _configFlavor() async {
  final String? flavor =
  await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
  print("config_flavor - flavor: $flavor");
}