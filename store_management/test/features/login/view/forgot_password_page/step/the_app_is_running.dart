import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(const ForgotPasswordPage());
}
