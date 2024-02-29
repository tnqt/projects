import 'package:firebase_storage_api/firebase_storage_api.dart';
import 'package:local_storage_api/local_storage_api.dart';
import 'package:shared_module/shared_module.dart';

class AppConfig implements GlobalConfig {
  @override
  final String apiBaseUrl = '';

  @override
  final String appName = 'Thao Nguyen Store Management';

  @override
  TenantConfigModel get tenantConfigModel => TenantConfigModel.empty;

  // Setter for tenantConfigModel
  set tenantConfigModel(TenantConfigModel tenantConfigModel) {
    tenantConfigModel = tenantConfigModel;
  }

  get localStorageApi {
    final localStorageApi = LocalStorageApi();
    return localStorageApi;
  }

  get firebaseStorageApi {
    final firebaseStorageApi = FirebaseStorageApi();
    return firebaseStorageApi;
  }
}
