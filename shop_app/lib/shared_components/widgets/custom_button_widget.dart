import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

class CustomButtonWidget {
  static ButtonTheme buildRaisedButton({
    required Function onPress,
    ButtonType type = ButtonType.primaryButton,
    String btnText = '',
  }) {
    switch (type) {
      case ButtonType.primaryButton:
        return ButtonTheme(
          child: ElevatedButton(
            onPressed: () => onPress.call(),
            child: Text(
              btnText.isEmpty ? 'Đồng ý' : btnText,
              textAlign: TextAlign.center,
            ),
          ),
        );

      case ButtonType.secondaryButton:
        return ButtonTheme(
          child: ElevatedButton(
            onPressed:  () => onPress.call(),
            child: Text(
              btnText.isEmpty ? 'Huỷ' : btnText,
              textAlign: TextAlign.center,
            ),
          ),
        );
    }
  }

  static GestureDetector iOSButton(
      {required Function onPress,
      required String btnText,
      TextStyle textStyle = const TextStyle(
        decoration: TextDecoration.none,
        fontFamily: Constant.appFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.blue,
      )}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPress(),
      child: Container(
        padding: const EdgeInsets.all(
          Dimensions.paddingDefault,
        ),
        child: Text(
          btnText,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
