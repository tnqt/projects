import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

Future<void> iSeeForgotPasswordPage(WidgetTester tester) async {
  expect(find.byType(ForgotPasswordPage), findsOneWidget);
}
