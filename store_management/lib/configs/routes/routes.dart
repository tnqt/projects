import 'package:equatable/equatable.dart';

class Routes extends Equatable {
  static const root = '/';

  // static const home = '/';

  static const login = '/login';

  @override
  List<Object?> get props => [
        root,
        // home,
        login,
      ];
}
