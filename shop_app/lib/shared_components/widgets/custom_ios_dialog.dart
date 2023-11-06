import 'package:flutter/cupertino.dart';
import 'package:shop_app/shop_app.dart';

class CustomIOSDialog extends StatelessWidget {
  const CustomIOSDialog({
    Key? key,
    this.title = '',
    this.dialogType = CustomDialogType.info,
    required this.body,
    this.btnOkText = 'OK',
    required this.btnOkOnPress,
    this.btnCancelText = 'Cancel',
    required this.btnCancelOnPress,
  }) : super(key: key);

  final String title;
  final CustomDialogType dialogType;
  final Widget body;

  // btn ok
  final String btnOkText;
  final Function btnOkOnPress;

  // btn cancel
  final String btnCancelText;
  final Function btnCancelOnPress;

  Widget get titleWidget => Text(
        title.isEmpty ? dialogType.titleText ?? '' : title,
        textAlign: TextAlign.center,
      );

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case CustomDialogType.info:
        return CupertinoAlertDialog(
          title: titleWidget,
          content: body,
          actions: [
            CustomButtonWidget.iOSButton(
              onPress: () => btnOkOnPress,
              btnText: btnOkText,
            )
          ],
        );
      case CustomDialogType.warning:
        return CupertinoAlertDialog(
          title: titleWidget,
          content: body,
          actions: [
            CustomButtonWidget.iOSButton(
              onPress: () => btnOkOnPress,
              btnText: btnOkText,
            )
          ],
        );
      default:
        return CupertinoAlertDialog(
          title: titleWidget,
          content: body,
          actions: const [],
        );
    }
  }
}
