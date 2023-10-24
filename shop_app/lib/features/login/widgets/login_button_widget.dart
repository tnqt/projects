import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shop_app.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.loginProgress == LoginProgress.loginInProgress
          ? Container(
              margin: const EdgeInsets.all(
                Dimensions.paddingDefault,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                // child: CustomSpinkitCircle(
                //   height: 45,
                // ),
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
                  Dimensions.paddingDefault,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF66BB6A),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Login',
                  style: CustomTextStyle.textStyle16WhiteW500,
                ),
              ),
            );
    });
  }
}
