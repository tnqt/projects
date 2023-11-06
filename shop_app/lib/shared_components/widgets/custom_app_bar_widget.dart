import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
   const CustomAppBarWidget({
    Key? key,
    this.backgroundColor,
    this.leadingColor,
    required this.height,
    required this.title,
  }) : super(key: key);

  final double height;
  final String title;
  final Color? backgroundColor;
  final Color? leadingColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('CustomAppBarWidget'),
      padding: const EdgeInsets.only(top: 30.0),
      color: backgroundColor ?? const Color(0xFF66BB6A),
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                alignment: Alignment.centerLeft,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.navigate_before,
                  size: 30,
                  color: leadingColor ?? Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(title, style: CustomTextStyle.textStyleForAppBar),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
