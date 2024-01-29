import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

void bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

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

