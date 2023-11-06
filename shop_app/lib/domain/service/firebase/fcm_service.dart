
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/shop_app.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<bool> registerFCM() async {
    bool result = false;
    try {
      if (Platform.isIOS) {
        result = await _requestIosFCMPermission();
      } else {
        result = await _registerFCMToken();
      }
      FirebaseLogger()
          .log("register_fcm", "result: ${result ? "Success" : "Failure"}");

      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(Constant.isRegisteredFcm, result);

      return result;
    } catch (e) {
      FirebaseLogger().logWarning("register_fcm", "error: ${e.toString()}");
      return result;
    }
  }

  Future<bool> isRegisteredFCM() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constant.isRegisteredFcm) ?? false;
  }

  /// Checks if FCM is registered and, if not, registers it again.
  Future<void> ensureFCMRegistration() async {
    try {
      final isRegistered = await isRegisteredFCM();
      if (!isRegistered) {
        await registerFCM();
      } else {
        // In case registered if fcm token was generated in app
        // We have to send fcm token to server again
        compareFcmToken(isForceResendToken: false);
      }
    } catch (e) {
      FirebaseLogger().logWarning("fcm_token", "error: ${e.toString()}");
    }
  }

  Future<void> compareFcmToken({bool isForceResendToken = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refreshFcmToken = prefs.getString(Constant.isRegisteredFcm) ?? "";

    if (refreshFcmToken.isNotEmpty) {
      // Force resend FCM Refresh Token
      FirebaseLogger().log(
          "fcm_token", "force send refresh token server: ${refreshFcmToken}");
      // if (await FCMService().sendFCMTokenToServer(refreshFcmToken) == true) {
      //   // Success
      //   // Reset refresh token
      //   FirebaseLogger().log("fcm_token", "Remove refresh token local");
      //   prefs.remove(Constant.isRegisteredFcm);
      // }
    } else {
      // Refresh token empty
      // Compare last fcm and new token
      String? newToken = await _firebaseMessaging.getToken();
      if (newToken != null && newToken.isNotEmpty) {
        if (isForceResendToken == true) {
          FirebaseLogger()
              .log("fcm_token", "force send new token server: ${newToken}");
          // await FCMService().sendFCMTokenToServer(newToken);
        } else {
          // Compare fcm before resend FCM Token
          String lastFcmToken = prefs.getString(Constant.isRegisteredFcm) ?? "";
          if (newToken != lastFcmToken) {
            FirebaseLogger()
                .log("fcm_token", "send new token server: ${newToken}");
            // await FCMService().sendFCMTokenToServer(newToken);
          }
        }
      }
    }
  }

  /// Register FCM with firebase and send FCM token to server
  /// Output: true: success - false: failure
  Future<bool> _registerFCMToken() async {
    try {
      // Register FCM with firebase
      await _firebaseMessaging.setAutoInitEnabled(true);
      String? token;
      token = await _firebaseMessaging.getToken();

      FirebaseLogger().log("fcm_token", "$token");
      if (token == null || token == "") {
        FirebaseLogger()
            .log("register_fcm_token_fail", "Unable to get FCM token");
        return false;
      }

      // Send FCM token to server
      // return await sendFCMTokenToServer(token);
      return true;
    } catch (e) {
      FirebaseLogger().logWarning("register_fcm_token", "error: ${e.toString()}");
      return false;
    }
  }

  // Future<bool> sendFCMTokenToServer(String token) async {
  //   try {
  //     http.Response response = await NotificationApi()
  //         .fcmRegister(token)
  //         .timeout(EndPoint.REQUEST_LIMIT_TIME_OUT);
  //     if (await AuthUtil.checkLogout(response)) {
  //       FirebaseLogger()
  //           .log('check_logout', 'Current user is logging in other device ');
  //       return false;
  //     }

  //     Map<String, dynamic> resp =
  //         json.decode(UtilService().utf8Convert(response.body));

  //     if (!resp.containsKey("errorCode") || resp["errorCode"] != 0) {
  //       logger.e(UtilService().utf8Convert(response.body));
  //       FirebaseLogger().log("send_fcm_token_to_server", "");
  //       return false;
  //     } else {
  //       FirebaseLogger().log("send_fcm_token_to_server_success", "");
  //       // Save FCM Token
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString(Constant.LAST_FCM_TOKEN, token);
  //       FirebaseLogger().log("fcm_token", "save token fcm success: ${token}");

  //       return true;
  //     }
  //   } catch (err) {
  //     FirebaseLogger().logWarning("send_fcm_token_to_server_fail", "$err");
  //     return false;
  //   }
  // }

  Future<bool> _requestIosFCMPermission() async {
    bool _result = false;
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseLogger().log("user_granted_fcm_permission", "");
      _result = await _registerFCMToken();
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      FirebaseLogger().log("User granted FCM provisional permission", "");
      _result = false;
    } else {
      _result = false;
      FirebaseLogger()
          .log("User declined or has not accepted FCM permission", "");
    }
    return _result;
  }

  Future deregisterFCM() async {
    await _firebaseMessaging.deleteToken();
  }
}
