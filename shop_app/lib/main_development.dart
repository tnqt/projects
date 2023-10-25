import 'dart:async';


// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await _firebaseConfiguration();

  // final localStorageApi = LocalStorageStoreApi();
  // final firebaseStorageApi = FirebaseStorageApi();

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
