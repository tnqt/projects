import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:shared_module/shared_module.dart';

extension PumpApp on WidgetTester {
  // Future<void> pumpApp(Widget widget) {
  //   return pumpWidget(
  //     MaterialApp(
  //       // localizationsDelegates: const [
  //       //   AppLocalizations.delegate,
  //       //   GlobalCupertinoLocalizations.delegate,
  //       //   GlobalMaterialLocalizations.delegate,
  //       //   GlobalWidgetsLocalizations.delegate,
  //       // ],
  //       // supportedLocales: const [
  //       //   Locale('vi', 'VietNam'),
  //       //   Locale('en', 'USA'),
  //       // ],
  //       // locale: const Locale('en', 'USA'),
  //       home: Scaffold(body: widget),
  //     ),
  //   );
  // }

  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      // MaterialApp.router(
      //   localizationsDelegates: const [
      //     // AppLocalization.delegate,
      //     // AppLocalizationsDelegate(isTest: true),
      //     GlobalCupertinoLocalizations.delegate,
      //     GlobalMaterialLocalizations.delegate,
      //     GlobalWidgetsLocalizations.delegate,
      //   ],
      //   home: Scaffold(body: widget),
      // ),
      MaterialApp(
        localizationsDelegates: const [
          // AppLocalization.delegate,
          // AppLocalizationsDelegate(isTest: true),
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(body: widget),
      ),
    );

    // await pumpAndSettle();
    await pump();
    return;
  }
}
