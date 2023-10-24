import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

class RegisterAccountWidget extends StatelessWidget {
  const RegisterAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Navigator.pushNamed(context, RegisterPage.routeName);
      },
      child: RichText(
        text: const TextSpan(
          text: 'Don\'t have an account? ',
          style: CustomTextStyle.textStyle16Grey600W400,
          children: [
            TextSpan(
                text: 'Register',
                style: CustomTextStyle.textStyle16GreenW700),
          ],
        ),
      ),
    );
  }
}
