import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/store_management.dart';

Future<void> iSeeLoginForm(WidgetTester tester) async {
  expect(find.byType(LoginForm), findsOneWidget);
}
