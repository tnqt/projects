import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

Future<void> iSeeLoginPage(WidgetTester tester) async {
  expect(find.byType(LoginPage), findsOneWidget);
}
