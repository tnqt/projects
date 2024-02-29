import 'package:dio/dio.dart';
import 'package:shared_module/shared_module.dart';

class SuperAppDelegates extends AppDelegates {
  @override
  final Dio dio;

  @override
  final GlobalConfig config;

  SuperAppDelegates(this.config, this.dio);

  @override
  Future<String> get deviceId async {
    return '';
  }
}
