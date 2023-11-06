
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:queue/queue.dart';
import 'package:shop_app/shop_app.dart';

class FirebaseLogger {
  static final FirebaseLogger _instance = FirebaseLogger._internal();
  final FirebaseAnalytics firebaseLogger = FirebaseAnalytics.instance;

  factory FirebaseLogger() => _instance;

  FirebaseLogger._internal();

  var logger = Logger(printer: SimplePrinter(printTime: true), output: LoggerOutput.instance, filter: AppLogFilter());
  var debugLogger = Logger(printer: PrettyPrinter());

  var queue = Queue();

  void dispose() => queue.dispose();

  //Log information
  Future log(String title, String message) async {
    if (title.isEmpty) return;
    await queue.add(() async {
      title = title.replaceAll(" ", "_").toLowerCase();
      firebaseLogger.logEvent(
        name: title,
        parameters: <String, dynamic>{
          'message': message,
          'username': "",
          'datetime': "${DateTime.now()}",
        },
      );

      if (message.isEmpty) {
        logger.i(title);
      } else {
        logger.i("$title - $message");
      }

      if (kDebugMode) {
        if (message.isEmpty) {
          debugLogger.i(title);
        } else {
          debugLogger.i("$title - $message");
        }
      }

      await Future.delayed(const Duration(milliseconds: 150));
      return Future.value(true);
    });
  }

  //Log Error
  Future logError(String title, String message) async {
    if (title.isEmpty) return;
    await queue.add(() async {
      title = title.replaceAll(" ", "_").toLowerCase();
      firebaseLogger.logEvent(
        name: title,
        parameters: <String, dynamic>{
          'message': message,
          'username': "",
          'datetime': "${DateTime.now()}",
        },
      );
      if (message.isEmpty) {
        logger.e(title);
      } else {
        logger.e("$title - $message");
      }
      if (kDebugMode) {
        if (message.isEmpty) {
          debugLogger.e(title);
        } else {
          debugLogger.e("$title - $message");
        }
      }

      await Future.delayed(const Duration(milliseconds: 150));
      return Future.value(true);
    });
  }

  //Log warning
  Future logWarning(String title, String message) async {
    if (title.isEmpty) return;
    await queue.add(() async {
      title = title.replaceAll(" ", "_").toLowerCase();
      firebaseLogger.logEvent(
        name: title,
        parameters: <String, dynamic>{
          'message': message,
          'username': "",
          'datetime': "${DateTime.now()}",
        },
      );
      if (message.isEmpty) {
        logger.w(title);
      } else {
        logger.w("$title - $message");
      }
      if (kDebugMode) {
        if (message.isEmpty) {
          debugLogger.w(title);
        } else {
          debugLogger.w("$title - $message");
        }
      }

      await Future.delayed(const Duration(milliseconds: 150));
      return Future.value(true);
    });
  }

  Future logMapInfo(String title, Map<String, dynamic> parameters) async {
    if (title.isEmpty) return;
    title = title.replaceAll(" ", "_").toLowerCase();
    String username = "";
    parameters.addAll(
      <String, dynamic>{
        'username': username,
      },
    );

    firebaseLogger.logEvent(
      name: title,
      parameters: parameters,
    );
  }

  // static Future<bool> sendLogsToServer(File file, [int retry = 1]) async {
  //   try {
      
  //   } catch (error) {
  //     FirebaseLogger().logWarning("send_log_to_server", "error: ${error.toString()}");
  //     return false;
  //   }
  // }

  Future<File?> exportLog({bool getAllLog = true}) async {
    try {
      // File file = await FLog.exportLogs().timeout(Duration(seconds: 15));
      Directory? directory;
      List<File> logFiles = [];

      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = await getExternalStorageDirectory();
      }

      // logFiles.add(file);

      final path = "${directory?.path ?? ""}/FLogs";
      Directory logDirectory = Directory(path);

      File loggerFile = File("$path/logger.txt");
      logFiles.add(loggerFile);

      if (Platform.isAndroid) {
        var nativeLogFile = File("$path/android_crash_log.txt");
        var isExistNativeLog = await nativeLogFile.exists();
        if (isExistNativeLog) logFiles.add(nativeLogFile);

        var serviceLogFile = File("$path/vhealth_service_log.txt");
        var isExistServiceLog = await serviceLogFile.exists();
        if (isExistServiceLog) logFiles.add(serviceLogFile);

        var nativeCloseLogFile = File("${path}/flutter_native_log.txt");
        var isExistNativeCloseLog = await nativeCloseLogFile.exists();
        if (isExistNativeCloseLog) logFiles.add(nativeCloseLogFile);
      } else {
        var nativeLogFile = File("${path}/iosnative_log.txt");
        var isExistNativeLog = await nativeLogFile.exists();
        FirebaseLogger().log("export_log_server", "${nativeLogFile}");
        FirebaseLogger().log("export_log_server", "Exist: ${isExistNativeLog}");
        if (isExistNativeLog) logFiles.add(nativeLogFile);
      }

      if (logFiles.isNotEmpty) {
        var encoder = ZipFileEncoder();
        encoder.zipDirectory(logDirectory, filename: "${path}/flog.zip");
        final zipFile = File("${path}/flog.zip");
        if (zipFile.existsSync()) {
          // bool sendLogToServerResult =
              // await FirebaseLogger.sendLogsToServer(zipFile)
              //     .timeout(const Duration(seconds: 15));
          // if (sendLogToServerResult) {
          //   clearLogDatabase();
          //   FirebaseLogger().log("export_log_server", "success");
          // } else {
          //   FirebaseLogger().log("export_log_server", "fail");
          // }

          return zipFile;
        } else {
          FirebaseLogger().log("export_log_server", "file not exist");
          return null;
        }
      } else {
        FirebaseLogger().log("export_log_server", "list empty");
      }
      return null;
    } catch (error) {
      FirebaseLogger().logWarning("export_log_server", "error: ${error.toString()}");
      return null;
    }
  }

  Future<bool> clearLogDatabase() async {
    try{
      // await FLog.clearLogs();
      LoggerOutput.instance.clearLog();
      FirebaseLogger().log("clear_log", "success");
      return true;
    } catch (error) {
      FirebaseLogger().logWarning("clear_log", "error: ${error.toString()}");
      return false;
    }
  }
}
