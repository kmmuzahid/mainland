import Flutter
import UIKit
import GoogleMaps	
import Photos

@main
@objc class AppDelegate: FlutterAppDelegate {
  
  private let photoPermissionChannel = "photoPermissionChannel"  // Define channel name
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Google Maps API Key
    // GMSServices.provideAPIKey("AIzaSyDk7p1Vl9WOtcDztagS6yPsgUYaVu_bCro")
    
    // 🍎 Register for remote notifications (APNs) - REQUIRED for FCM on iOS
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: { _, _ in }
      )
    } else {
      let settings: UIUserNotificationSettings =
        UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }

    application.registerForRemoteNotifications()

    // Access the FlutterViewController to create the MethodChannel
    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("RootViewController is not of type FlutterViewController")
    }
    
    // Initialize the method channel
    let permissionChannel = FlutterMethodChannel(name: photoPermissionChannel, binaryMessenger: controller.binaryMessenger)

    // Handle method calls
    permissionChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "requestPhotoPermission" {
        self?.requestPhotoPermission(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // 🍎 APNs Token Registration Success
  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print("✅ APNs Device Token: \(deviceToken.map { String(format: "%02.2hhx", $0) }.joined())")
    super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }

  // 🍎 APNs Token Registration Failed
  override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("❌ Failed to register for remote notifications: \(error.localizedDescription)")
    super.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
  }

  // Photo permission request
  private func requestPhotoPermission(result: @escaping FlutterResult) {
    PHPhotoLibrary.requestAuthorization { status in
      switch status {
      case .authorized:
        result("Photo access granted")
      case .denied, .restricted:
        result("Photo access denied")
      case .notDetermined:
        result("Photo access not determined")
      @unknown default:
        result(FlutterError(code: "UNKNOWN", message: "Unknown permission status", details: nil))
      }
    }
  }
}
