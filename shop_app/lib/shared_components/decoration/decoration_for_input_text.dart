import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

InputDecoration decorationForInputTextField({
  String hintText = "",
  enabled = true,
  TextStyle hintStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 17.0,
    fontFamily: Constant.appFontFamily,
    fontWeight: FontWeight.w300,
  ),
  bool isPrefixIcon = true,
  Widget prefixIcon = const Icon(
    Icons.search_rounded,
    color: Color(0xFFC9C9C9),
    size: 25,
  ),
  bool isSuffixIcon = false,
  Widget? suffixIcon,
  OutlineInputBorder? enabledBorder,
  OutlineInputBorder? focusedBorder,
}) {
  return InputDecoration(
    fillColor: Colors.grey[200]!,
    enabled: enabled,
    filled: !enabled,
    // border: InputBorder.none,
    enabledBorder: enabledBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.white,
            // color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Colors.yellow,
        // color: Colors.grey[300]!,
        width: 1.0,
      ),
    ),
    focusedBorder: focusedBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: Color(0xFF66BB6A),
          ),
        ),
    hintText: hintText,
    hintStyle: hintStyle,
    prefixIcon: isPrefixIcon ? prefixIcon : null,
    suffixIcon: isSuffixIcon ? suffixIcon : null,
  );
}
