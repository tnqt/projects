import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.loginProgress == LoginProgress.loginInProgress
          ? Container(
              margin: const EdgeInsets.all(
                shared_module.Dimensions.paddingDefault,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: shared_module.CustomSpinkitCircle(
                  height: 45,
                ),
              ),
            )
          : GestureDetector(
              key: const Key('LoginButtonWidget'),
              onTap: () {
                context.read<LoginBloc>().add(const LoginSubmitted());
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                height: 56,
                margin: const EdgeInsets.all(
                  shared_module.Dimensions.paddingDefault,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF66BB6A),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: shared_module.CustomTextStyle.textStyle16WhiteW500,
                ),
              ),
            );
    });
  }
}
