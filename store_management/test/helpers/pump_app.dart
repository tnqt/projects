import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

import 'mock_navigator.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          shared_module.AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(body: widget),
      ),
    );

    await pump();
    return;
  }

  Future<void> pumpRouterApp(Widget widget, MockGoRouter mockGoRouter) async {
    await pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          shared_module.AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: MockGoRouterProvider(goRouter: mockGoRouter, child: widget),
      ),
    );

    await pump();
    return;
  }

  // Future<void> pumpRealRouterApp(
  //   String location,
  //   Widget Function(Widget child) builder, {
  //   bool isConnected = true,
  // }) {
  //   // Logic to initialize my StateManagement with the
  //   // value of isConnected
  //   // ...

  //   return pumpWidget(
  //     builder(
  //       MaterialApp.router(
  //         localizationsDelegates: const [
  //           AppLocalizations.delegate,
  //           shared_module.AppLocalizations.delegate,
  //           GlobalCupertinoLocalizations.delegate,
  //           GlobalMaterialLocalizations.delegate,
  //           GlobalWidgetsLocalizations.delegate,
  //         ],
  //         routeInformationParser: routerConfig.routeInformationParser,
  //         routerDelegate: routerConfig.routerDelegate,
  //       ),
  //     ),
  //   );
  // }

  // String getRouterKey(String route) {
  //   return 'key_$route';
  // }

  // Future<void> pumpRouterApp(Widget widget) {
  //   const initialLocation = '/login';

  //   final router = GoRouter(
  //     initialLocation: initialLocation,
  //     routes: [
  //       GoRoute(
  //         path: initialLocation,
  //         builder: (context, state) => widget,
  //       ),
  //       ...Routes()
  //           .props
  //           .map(
  //             (e) => GoRoute(
  //               path: e! as String,
  //               builder: (context, state) => Container(
  //                 key: Key(
  //                   getRouterKey(e as String),
  //                 ),
  //               ),
  //             ),
  //           )
  //           .toList()
  //     ],
  //   );

  //   return pumpWidget(
  //     MaterialApp.router(
  //       localizationsDelegates: const [
  //         AppLocalizations.delegate,
  //         shared_module.AppLocalizations.delegate,
  //         GlobalCupertinoLocalizations.delegate,
  //         GlobalMaterialLocalizations.delegate,
  //         GlobalWidgetsLocalizations.delegate,
  //       ],
  //       routerConfig: routerConfig,
  //       // routeInformationParser: router.routeInformationParser,
  //       // routerDelegate: router.routerDelegate,
  //     ),
  //   );
  // }
}
