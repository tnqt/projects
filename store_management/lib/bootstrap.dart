import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
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

  registerAppDelegates(appConfig);

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


AppDelegates registerAppDelegates(AppConfig appConfig) {
  final dio = configureNewDio(appConfig);
  final appDelegates = SuperAppDelegates(appConfig, dio);
  MiniAppManager.registerAppDelegates(appDelegates);
  return appDelegates;
}

Dio configureNewDio(AppConfig appConfig) {
  Dio dio = Dio();
  dio.options.baseUrl = appConfig.apiBaseUrl;
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    if (!options.headers.containsKey('content-type')) {
      options.headers['content-type'] = 'application/json';
    }
    return handler.next(options);
  }));
  return dio;
}
