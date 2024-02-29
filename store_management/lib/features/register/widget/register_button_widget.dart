import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          context.read<RegisterBloc>().add(const RegisterSubmitted());
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
            AppLocalizations.of(context)!.register,
            style: shared_module.CustomTextStyle.textStyle16WhiteW500,
          ),
        ),
      );
    });
  }
}
