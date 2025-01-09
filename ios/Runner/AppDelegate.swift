import Flutter
import UIKit
import flutter_background_service_ios
@main
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "com.codera.template/channel"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("RootViewController is not a FlutterViewController")
    }

    let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler { [weak self] (call, result) in
      if call.method == "getLocalTimezone" {
        let timezone = TimeZone.current.identifier
        result(timezone)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    SwiftFlutterBackgroundServicePlugin.taskIdentifier = "com.codera.template/channel"

    SwiftFlutterForegroundTaskPlugin.setPluginRegistrantCallback { registry in
      GeneratedPluginRegistrant.register(with: registry)
    }
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self // 设置通知代理
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
