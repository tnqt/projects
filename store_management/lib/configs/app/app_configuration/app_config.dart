


import 'package:firebase_storage_api/firebase_storage_api.dart';
import 'package:local_storage_api/local_storage_api.dart';
import 'package:shared_module/shared_module.dart';
class AppConfig implements GlobalConfig {
  @override
  final String apiBaseUrl = '';

  @override
  final String appName = 'Thao Nguyen Store Management';

  @override
  get localStorageApi {
    final localStorageApi = LocalStorageApi();
    return localStorageApi;
  }

  @override
  get firebaseStorageApi {
    final firebaseStorageApi = FirebaseStorageApi();
    return firebaseStorageApi;
  }
}