import 'package:coffee_restaurant/coffee_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RememberMeWidgetState();
}

class RememberMeWidgetState extends State<RememberMeWidget> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = false;
    getIsRememberMe();
    super.initState();
  }

  Future<void> getIsRememberMe() async {
    RememberMeModel rememberMeModel = await Util.getRememberMeModel();
    if (rememberMeModel.isRemember) {
      setState(() {
        isChecked = true;
      });
      // ignore: use_build_context_synchronously
      context.read<LoginBloc>().add(const LoginRememberMeChanged(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        isChecked ^= true;
        context.read<LoginBloc>().add(LoginRememberMeChanged(isChecked));
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: Dimensions.paddingMedium,
        ),
        child: Row(
          children: [
            Icon(
              isChecked
                  ? Icons.radio_button_checked_outlined
                  : Icons.radio_button_off_outlined,
              color: Colors.green,
            ),
            const SizedBox(width: 20),
            const Text(
              'Remember me',
              style: CustomTextStyle.textStyle16BlackW400,
            ),
          ],
        ),
      ),
    );
  }
}
