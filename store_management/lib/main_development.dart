import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_management/bootstrap.dart';

import 'utils/helper/firebase_logger.dart';

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
  print("config_flavor - flavor");
  final String? flavor =
  await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
  print("config_flavor - flavor: $flavor");
  // logger.d('APP STARTED WITH FLAVOR $flavor');
  
  // // SET UP GLOBAL Flavor
  // globalFlavor = flavor;

  // FlavorConfig(name: flavor, variables: {
  //   "baseUrl": _getAPIBaseUrlByFlavorName(flavor!),
  //   // true : verify mac address otherwise NOT verify mac address
  //   "verifyMacAddress": false,
  //   "allowSyncData": true,
  // });
  // logger.d('BASE URL : ${FlavorConfig.instance.variables["baseUrl"]}');
  // logger.d(
  //     'verifyMacAddress : ${FlavorConfig.instance.variables["verifyMacAddress"]}');
}