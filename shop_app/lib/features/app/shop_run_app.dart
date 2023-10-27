import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shop_app.dart';

/// CoffeeRestaurantApp is responsible for creating/providing the Bloc
/// which will be consumed by the CoffeeRestaurantAppView
/// This decoupling will enable us to easily test both the CoffeeRestaurantApp and
/// CoffeeRestaurantAppView widgets later on.
class ShopRunApp extends StatelessWidget {
  const ShopRunApp({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
    required this.callback,
    required this.locale,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
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
        // RepositoryProvider.value(
        //   value: userRepository,
        // ),
        // RepositoryProvider.value(
        //   value: storageRepository,
        // ),
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<DashboardCubit>(
          //   // lazy: false,
          //   create: (BuildContext context) => DashboardCubit(
          //     storageRepository: storageRepository,
          //   )..init(),
          // ),
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              userRepository: userRepository,
            ),
          ),
          // BlocProvider<NotificationCubit>(
          //   create: (BuildContext context) => NotificationCubit(),
          // ),
        ],
        child: ShopAppView(
          callback: callback,
          locale: locale,
        ),
      ),
    );
  }
}

class ShopAppView extends StatefulWidget {
  const ShopAppView({
    Key? key,
    required this.callback,
    required this.locale,
  }) : super(key: key);

  final VoidCallback callback;
  final Locale locale;

  @override
  State<StatefulWidget> createState() => ShopAppViewState();
}

class ShopAppViewState extends State<ShopAppView> {
  // final _navigatorKey = GlobalKey<NavigatorState>();
  // NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void dispose() {
    widget.callback.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoffeeRestaurant',
      showPerformanceOverlay: false,
      checkerboardRasterCacheImages: false,
      initialRoute: SplashScreen.routeName,
      // navigatorKey: _navigatorKey,
      navigatorKey: ShopRunApp.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      ),
      onGenerateRoute: (settings) => PageRouteBuilder(
        pageBuilder: (context, _, __) => routes[settings.name]!(context),
        settings: settings,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      locale: widget.locale,
      localizationsDelegates: const [
        // AppLocalization.delegate,
        // GlobalCupertinoLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
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
                ShopRunApp.navigatorKey.currentContext!,
                state.status,
                state.user,
              ),
            ),
          ],
          child: child ?? Container(),
        );
      },
    );
  }
}
