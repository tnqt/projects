import 'package:flutter/material.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

class RegisterAccountWidget extends StatelessWidget {
  const RegisterAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, RegisterPage.routeName);
      },
      child: RichText(
        text: TextSpan(
          style: shared_module.CustomTextStyle.textStyle16Grey600W400,
          children: [
            TextSpan(
                text: AppLocalizations.of(context)!.register,
                style: shared_module.CustomTextStyle.textStyle16GreenW700),
          ],
        ),
      ),
    );
  }
}
