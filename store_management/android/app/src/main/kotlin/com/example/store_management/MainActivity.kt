package com.example.store_management

import io.flutter.embedding.android.FlutterActivity

private const val kChannel = "flavor"
private const val kMethodFlavor = "getFlavor"

class MainActivity: FlutterActivity() {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), kChannel).setMethodCallHandler(
            (call, result) -> {
                switch (call.method){
                    case kMethodFlavor:
                        result.success(BuildConfig.FLAVOR);
                        break;
                    default:
                        result.notImplemented();
                        break;
                }
            });

    }
}
