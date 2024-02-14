import 'package:flutter/material.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Navigator.of(context).pop();
      },
      child: RichText(
        text: TextSpan(
          text: AppLocalizations.of(context)!.already_have_an_account,
          style: shared_module.CustomTextStyle.textStyle16Grey600W400,
          children: [
            TextSpan(
                text: AppLocalizations.of(context)!.login,
                style: shared_module.CustomTextStyle.textStyle16GreenW700),
          ],
        ),
      ),
    );
  }
}
