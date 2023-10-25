import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: RichText(
        text: const TextSpan(
          text: 'Already have an account? ',
          style: CustomTextStyle.textStyle16Grey600W400,
          children: [
            TextSpan(
                text: 'Login',
                style: CustomTextStyle.textStyle16GreenW700),
          ],
        ),
      ),
    );
  }
}
