import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () {
                context.read<LoginBloc>().add(const LoginForgotPassword());
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: shared_module.Dimensions.paddingDefault,
                ),
                child: Text(
                  AppLocalizations.of(context)!.forgot_password,
                  style: shared_module.CustomTextStyle.textStyle16GreenW500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: state.loginProgress == LoginProgress.forgotPasswordInProgress
                ? const Align(
                    alignment: Alignment.centerLeft,
                    child: shared_module.CustomSpinkitCircle(
                      height: 45,
                    ))
                : Container(),
          )
        ],
      );
    });
  }
}
