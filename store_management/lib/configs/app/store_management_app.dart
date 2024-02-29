import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

/// StoreManagementApp is responsible for creating/providing the Bloc
/// which will be consumed by the StoreManagementAppView
/// This decoupling will enable us to easily test both the StoreManagementApp and
/// StoreManagementAppView widgets later on.
class StoreManagementApp extends StatelessWidget {
  const StoreManagementApp({
    super.key,
    required this.authenticationRepository,
    required this.userRepository,
    required this.callback,
    required this.storageRepository,
    required this.locale,
  });

  final shared_module.AuthenticationRepository authenticationRepository;
  final shared_module.UserRepository userRepository;
  final shared_module.StorageRepository storageRepository;

  final VoidCallback callback;
  final Locale locale;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<shared_module.AuthenticationBloc>(
              create: (BuildContext context) =>
                  shared_module.AuthenticationBloc(
                      authenticationRepository: authenticationRepository,
                      userRepository: userRepository)),
          ...MiniAppManager.createBlocProviders(),
        ],
        child: StoreManagementAppView(
          callback: callback,
          locale: locale,
        ),
      ),
    );
  }
}

class StoreManagementAppView extends StatefulWidget {
  const StoreManagementAppView({
    super.key,
    required this.callback,
    required this.locale,
  });

  final VoidCallback callback;
  final Locale locale;

  @override
  State<StatefulWidget> createState() => StoreManagementAppViewState();
}

class StoreManagementAppViewState extends State<StoreManagementAppView> {
  @override
  void dispose() {
    widget.callback.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Store Management',
      showPerformanceOverlay: false,
      checkerboardRasterCacheImages: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      ),
      locale: widget.locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...MiniAppManager.getLocalizationsDelegates(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VietNam'),
        Locale('en', 'USA'),
      ],
      routerConfig: routerConfig,
    );
  }
}
