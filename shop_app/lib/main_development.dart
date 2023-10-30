import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/config/firebase_options.dart';
import 'package:shop_app/shop_app.dart';

import 'bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _firebaseConfiguration();

  // final localStorageApi = LocalStorageStoreApi();
  // final firebaseStorageApi = FirebaseStorageApi();
  await Future.delayed(const Duration(seconds: 1));
  bootstrap(
      // localStorageStoreApi: localStorageApi,
      // firebaseStorageApi: firebaseStorageApi,
      );
}

Future<void> _firebaseConfiguration() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    FirebaseLogger()
        .log("FCM is called in foreground", "message: ${message.data}");
  });
}
