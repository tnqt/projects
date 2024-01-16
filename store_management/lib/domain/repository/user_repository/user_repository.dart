import 'dart:async';

import 'model/model.dart';

// Manages the user domain.
class UserRepository {
  UserModel? _user;

  Future<UserModel?> getUser() async {
    if (_user != null) return _user;
    return null;
  }
}