
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:store_management/store_management.dart';

class RemoteConfigRepository {
    final remoteConfig = FirebaseRemoteConfig.instance;

    RemoteConfigRepository._internal() {
      // remoteConfig.setDefaults(const {
      //   "is_enable_adding_new_dish": false,
      // });
    }

    static final RemoteConfigRepository _instance =
        RemoteConfigRepository._internal();

    factory RemoteConfigRepository() {
      return _instance;
    }

  // Implement methods for initialize
  Future<void> initialize() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1), // it is important
    ));

    await remoteConfig.setDefaults(const {
      "is_shown_terms_of_use": true,
    });
  }

  // Implement methods to fetch, store, and retrieve data from Remote Config
  Future<void> fetchRemoteConfig() async {
    try {
      await remoteConfig.fetchAndActivate();
      await storeValue();

    } catch (e) {
      FirebaseLogger().log('fetch_remote_config', 'error: ${e.toString()}');
    }
  }

  Future<void> storeValue() async {
    // VisibleManagement.isShownTermsOfUse = await getBool('is_shown_terms_of_use');
  }

  Future<String> getString(String key) async {
    return remoteConfig.getString(key);
  }

  Future<int> getInt(String key) async {
    return remoteConfig.getInt(key);
  }

  Future<double> getDouble(String key) async {
    return remoteConfig.getDouble(key);
  }

  Future<bool> getBool(String key) async {
    return remoteConfig.getBool(key);
  }
}
