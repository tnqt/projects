import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        configAppFlavor()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func configAppFlavor() {
        let controller = window.rootViewController as! FlutterViewController
        let flavorChannel = FlutterMethodChannel(
            name: "flavor",
            binaryMessenger: controller.binaryMessenger)
        
        print("Init flavor")
        
        flavorChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // Note: this method is invoked on the UI thread
            
            print("Call getting flavor")
            let flavor = Bundle.main.infoDictionary?["App - Flavor"]
            result(flavor)
        })
    }
}
