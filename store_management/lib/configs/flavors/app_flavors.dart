// ignore_for_file: avoid_print

import 'package:flutter/services.dart';

enum Environment { development, staging, production }

class NativeFlavors {
  static const String kChannelName = 'flavor';
  static const String kMethodName = 'getFlavor';

  static Future<Environment> getFlavor() async {
    try {
      final String? flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
      print("config_flavor - flavor: $flavor");
      if (flavor == null) {
        return Environment.development;
      } else {
        return Environment.values.byName(flavor);
      }
    } catch (exception) {
      return Environment.development;
    }
  }
}
