import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shop_app.dart';

/// Using a much smaller initial program to load in the desired program
/// Concept: bootstrap means to boot or to load a program into a computer using a much smaller initial program to load in the desired program
///

void bootstrap(
    // {required LocalStorageStoreApi localStorageStoreApi,
    // required FirebaseStorageApi firebaseStorageApi}
    )
    {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  // final storageRepository = StorageRepository(
  //   localStorageStoreApi: localStorageStoreApi,
  //   firebaseStorageApi: firebaseStorageApi,
  // );

  runZonedGuarded(() async {
    // Init local database
    // final coffeeRestaurantDatabase = await LocalStorageStoreApi().database;
    // HydratedBloc.storage = await HydratedStorage.build(
    //     storageDirectory: await getApplicationDocumentsDirectory());

    // RemoteConfigRepository().initialize();

    String phoneLanguage =
        Platform.localeName.split('_')[0] == "vi" ? "vi" : "en";
    Locale locale = Locale(phoneLanguage);

    runApp(ShopRunApp(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
      // storageRepository: storageRepository,
      locale: locale,
      callback: () async {
        // await coffeeRestaurantDatabase.close();
      },
    ));
  }, (error, stackTrace) {
    FirebaseLogger()
        .log('bootstrap', "error: $error - stackTrace: $stackTrace");
  });
}
