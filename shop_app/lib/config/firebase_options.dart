// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDFyLXNlkepMoP6EGU4zFHRe_o8es-hQyo',
    appId: '1:358911668255:web:8fd1882f3ec6bd6b16652a',
    messagingSenderId: '358911668255',
    projectId: 'thaonguyen-de2cc',
    authDomain: 'thaonguyen-de2cc.firebaseapp.com',
    storageBucket: 'thaonguyen-de2cc.appspot.com',
    measurementId: 'G-ZKWV6P93KC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAEfG3gfrMftWRmynudz5vXqpd0M-QuNk4',
    appId: '1:358911668255:android:04837d718fecf81716652a',
    messagingSenderId: '358911668255',
    projectId: 'thaonguyen-de2cc',
    storageBucket: 'thaonguyen-de2cc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaJ6sfQNWpOzBJPLrfnDcbvfRO-unmXdQ',
    appId: '1:358911668255:ios:a2d826eac6359e5e16652a',
    messagingSenderId: '358911668255',
    projectId: 'thaonguyen-de2cc',
    storageBucket: 'thaonguyen-de2cc.appspot.com',
    iosClientId: '358911668255-pjsfdqgn0rdvvovvc2mcqmfec0gns0k4.apps.googleusercontent.com',
    iosBundleId: 'vn.tma.multipurposeThermalKit.ios.dev',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaJ6sfQNWpOzBJPLrfnDcbvfRO-unmXdQ',
    appId: '1:358911668255:ios:6b0a137e1d5632bc16652a',
    messagingSenderId: '358911668255',
    projectId: 'thaonguyen-de2cc',
    storageBucket: 'thaonguyen-de2cc.appspot.com',
    iosClientId: '358911668255-59r719quhv3ub3rvk4njr4jrvsl4evg1.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopApp.RunnerTests',
  );
}
