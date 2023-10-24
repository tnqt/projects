import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:shop_app/shop_app.dart';

class Util {
  ///Get log in information
  static Future<RememberMeModel> getRememberMeModel() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final loginInfo = json.decode(prefs.getString(Constant.rememberMeInfoLogin) ?? "");
      RememberMeModel rememberMeModel = loginInfo.isEmpty ? RememberMeModel.empty : RememberMeModel.fromJson(loginInfo);
      return rememberMeModel;
    } catch(err) {
      return RememberMeModel.empty;
    }
  }
}