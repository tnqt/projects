// import 'dart:io';

// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:flutter/foundation.dart';

// class FirebaseLogger {
//   FirebaseLogger._internal();

//   static final FirebaseLogger _instance = FirebaseLogger._internal();

//   factory FirebaseLogger() {
//     return _instance;
//   }

//   final FirebaseAnalytics logger = FirebaseAnalytics.instance;

//   Future log(String title, String message) async {
//     if (title.isEmpty) return;
//     title = title.replaceAll(" ", "_").toLowerCase();
//     message = message.replaceAll(" ", "_").toLowerCase();

//     // Send log to firebase
//     logger.logEvent(
//       name: title,
//       parameters: <String, dynamic>{
//         'message': message,
//         'username': "",
//         'dateTime': "${DateTime.now()}",
//       },
//     );

//     if (kDebugMode) {
//       print("$title - $message");
//     }

//     // Store log via flog
//     // message.isEmpty
//     //     ? FLog.info(text: title)
//     //     : FLog.info(text: "$title - $message");
//   }

//   Future<File?> exportLog() async {
//     return null;
  
//     // File file = await FLog.exportLogs().timeout(const Duration(seconds: 30));
//     // return file;
//     //   Directory? directory;
//     //   List<File> logFiles = [];

//     //   if (Platform.isIOS) {
//     //     directory = await getApplicationDocumentsDirectory();
//     //   } else {
//     //     directory = await getExternalStorageDirectory();
//     //   }

//     //   logFiles.add(file);
//   }
// }
