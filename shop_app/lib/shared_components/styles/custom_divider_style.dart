import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

mixin CustomDividerStyle {
  static Divider dividerLineStyle = const Divider(
    indent: 0,
    endIndent: 0,
    thickness: 1.5,
    color: Color.fromRGBO(235, 235, 235, 1),
  );

  static Divider dividerLineStyleWithIndentDefault = const Divider(
    indent: Dimensions.paddingDefault,
    endIndent: 0,
    thickness: 1.5,
    color: Color.fromRGBO(235, 235, 235, 1),
  );

  static Divider dividerLineStyleWithIndentEndIndentDefault = const Divider(
    indent: Dimensions.paddingDefault,
    endIndent: Dimensions.paddingDefault,
    thickness: 1.5,
    color: Color(0xFFD6D6D6),
  );

  static Divider dividerLineStyleWithGrey350 = const Divider(
    indent: 0,
    endIndent: 0,
    thickness: 1.5,
    color: Color(0xFFD6D6D6),
  );
}
