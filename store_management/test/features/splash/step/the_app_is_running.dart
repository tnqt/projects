import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

import '../../../helpers/pump_app.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {

  await tester.pumpApp(const SplashPage());
}
