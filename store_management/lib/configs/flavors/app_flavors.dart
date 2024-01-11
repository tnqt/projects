class NativeFlavors {
  static const String kChannelName = 'flavor';
  static const String kMethodName = 'getFlavor';

  static Future<Environment> getFlavor() async {

  }
}

enum Environment { development, staging, production }
