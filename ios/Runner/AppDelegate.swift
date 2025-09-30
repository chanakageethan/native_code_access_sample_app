import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      
      
      let controller = window?.rootViewController as! FlutterViewController
          let platformChannel = FlutterMethodChannel(name: "com.example/platform", binaryMessenger: controller.binaryMessenger)

          platformChannel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
            if call.method == "getPlatformVersion" {
              result(self.getPlatformVersion())
            } else {
              result(FlutterMethodNotImplemented)
            }
          }
      
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    
    private func getPlatformVersion() -> String {
        return "iOS \(UIDevice.current.systemVersion)"
      }
}
