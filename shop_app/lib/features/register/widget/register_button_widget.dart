import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shop_app.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          context.read<RegisterBloc>().add(const RegisterPhoneSubmitted());
          Navigator.pushNamed(context, RegisterVerificationOtpPage.routeName);
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
            'Register',
            style: CustomTextStyle.textStyle16WhiteW500,
          ),
        ),
      );
    });
  }
}
