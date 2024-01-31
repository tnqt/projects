import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/features/splash/splash_page.dart';

Future<void> iSeeSplashPage(WidgetTester tester) async {
  expect(find.byType(SplashPage), findsOneWidget);
}
