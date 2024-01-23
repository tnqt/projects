import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_management/store_management.dart';

void bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  // await _configFlavor();

  // final storageRepository = StorageRepository(
  //   localStorageStoreApi: localStorageStoreApi,
  //   firebaseStorageApi: firebaseStorageApi,
  // );

  // runZonedGuarded(() async {
  //   // Init local database
  //   final coffeeRestaurantDatabase = await LocalStorageStoreApi().database;
  //   HydratedBloc.storage = await HydratedStorage.build(
  //       storageDirectory: await getApplicationDocumentsDirectory());

  //   RemoteConfigRepository().initialize();

  //   String phoneLanguage =
  //       Platform.localeName.split('_')[0] == "vi" ? "vi" : "en";
  //   Locale locale = Locale(phoneLanguage);

  //   runApp(CoffeeRestaurantApp(
  //     authenticationRepository: AuthenticationRepository(),
  //     userRepository: UserRepository(),
  //     storageRepository: storageRepository,
  //     locale: locale,
  //     callback: () async {
  //       await coffeeRestaurantDatabase.close();
  //     },
  //   ));
  // }, (error, stackTrace) {
  //   FirebaseLogger()
  //       .log('bootstrap', "error: $error - stackTrace: $stackTrace");
  // });

  String phoneLanguage =
      Platform.localeName.split('_')[0] == "vi" ? "vi" : "en";
  Locale locale = Locale(phoneLanguage);

  runApp(StoreManagementApp(
    userRepository: UserRepository(),
    authenticationRepository: AuthenticationRepository(),
    
    locale: locale,
    callback: () async {},
  ));
}

