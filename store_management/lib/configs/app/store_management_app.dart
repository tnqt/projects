import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:store_management/store_management.dart';

/// StoreManagementApp is responsible for creating/providing the Bloc
/// which will be consumed by the StoreManagementAppView
/// This decoupling will enable us to easily test both the StoreManagementApp and
/// StoreManagementAppView widgets later on.
class StoreManagementApp extends StatelessWidget {
  const StoreManagementApp({
    Key? key,
    required this.authenticationRepository,
    // required this.userRepository,
    required this.callback,
    // required this.storageRepository,
    required this.locale,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  // final UserRepository userRepository;
  // final StorageRepository storageRepository;

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
    Key? key,
    required this.callback,
    required this.locale,
  }) : super(key: key);

  final VoidCallback callback;
  final Locale locale;

  @override
  State<StatefulWidget> createState() => StoreManagementAppViewState();
}

class StoreManagementAppViewState extends State<StoreManagementAppView> {
  // final _navigatorKey = GlobalKey<NavigatorState>();
  // NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void dispose() {
    widget.callback.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CoffeeRestaurant',
      showPerformanceOverlay: false,
      checkerboardRasterCacheImages: false,
      // initialRoute: SplashScreen.routeName,
      // navigatorKey: _navigatorKey,
      // navigatorKey: StoreManagementApp.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      ),
      // onGenerateRoute: (settings) => PageRouteBuilder(
      //   pageBuilder: (context, _, __) => routes[settings.name]!(context),
      //   settings: settings,
      //   transitionDuration: const Duration(milliseconds: 400),
      // ),
      locale: widget.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VietNam'),
        Locale('en', 'USA'),
      ],
      builder: (context, child) {
        return MultiBlocListener(
          listeners: [
            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) => authHandler(
                StoreManagementApp.navigatorKey.currentContext!,
                state.status,
                state.user,
              ),
            ),
          ],
          child: child ?? Container(),
        );
      },
      routerConfig: routerConfig,
    );
  }
}
