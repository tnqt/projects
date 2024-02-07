import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_api/local_storage_api.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

void bootstrap({required AppConfig appConfig}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  String phoneLanguage =
      Platform.localeName.split('_')[0] == "vi" ? "vi" : "en";
  Locale locale = Locale(phoneLanguage);

  // Init local database
  final localDatabase = await LocalStorageApi().database;

  final storageRepository = StorageRepository(
    localStorageApi: appConfig.localStorageApi,
    firebaseStorageApi: appConfig.firebaseStorageApi,
  );

  runApp(StoreManagementApp(
    userRepository: UserRepository(),
    authenticationRepository: AuthenticationRepository(),
    locale: locale,
    storageRepository: storageRepository,
    callback: () async {
      await localDatabase.close();
    },
  ));
}
