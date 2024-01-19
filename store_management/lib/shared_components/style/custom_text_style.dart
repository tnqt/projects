import 'package:flutter/material.dart';
import 'package:store_management/store_management.dart';

mixin CustomTextStyle {
  static const textStyleDefault = TextStyle(
    fontFamily: Constant.appFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );

  static const textStyleForAppBar = TextStyle(
    fontFamily: Constant.appFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.white,
  );

  static const textStyle14WhiteW400 = TextStyle(
    fontFamily: Constant.appFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.white,
  );
}