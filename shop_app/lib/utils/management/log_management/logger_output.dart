import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LoggerOutput extends LogOutput {
  static final LoggerOutput _instance = LoggerOutput._();

  LoggerOutput._();

  static LoggerOutput get instance => _instance;

  File? file;

  @override
  Future<void> init() async {
    super.init();
    try {
      await createFile();
    } catch (error) {

    }
  }

  Future<String> getFilePath() async {
    Directory? directory;
    String fileName = "logger.txt";

      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = await getExternalStorageDirectory();
      }

      final path = "${directory?.path ?? ""}/FLogs/${fileName}";

      return path;
  }

  Future<void> createFile() async {
    final path = await getFilePath();
    File pathFile = new File(path);
    bool isExist = await pathFile.existsSync();
    if (!isExist) {
      pathFile.createSync(recursive: true);
      file = pathFile;
    } else {
      file = pathFile;
    }
  }

  @override
  void output(OutputEvent event) async {
    try {
      if (file == null) await createFile();
      for (var line in event.lines) {
        file = await file?.writeAsString("${line.toString()}\n",
            mode: FileMode.writeOnlyAppend, flush: true);
      }
    } catch (error) {

    }
  }

  void clearLog() async {
    if (file != null) {
      await deleteFile();
    }
  }

  Future<void> deleteFile() async {
    try {
      if (file != null) {
        await file?.delete();
        await createFile();
      }
    } catch (e) {
      // Error in getting access to the file.
    }
  }
}
