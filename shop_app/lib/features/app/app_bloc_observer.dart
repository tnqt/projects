import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shop_app.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // FirebaseLogger().log('app_bloc_observer','onChange: (${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    FirebaseLogger().log('app_bloc_observer','onError: (${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
