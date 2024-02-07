import 'package:store_management/configs/app/app.dart';

// Base from App config due to initialize the same environment to all of flavor
// as localStorageApi, firebaseStorageApi
class AppStagingConfiguration extends AppConfig {
  @override
  String get apiBaseUrl => "";

  @override
  String get appName => "Thao Nguyen Staging Store Management";

}
