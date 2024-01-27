import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

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
    shared_module.RememberMeModel rememberMeModel =
        await shared_module.Util.getRememberMeModel();
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
          vertical: shared_module.Dimensions.paddingMedium,
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
            Text(
              AppLocalizations.of(context)!.remember_me,
              style: shared_module.CustomTextStyle.textStyle16BlackW400,
            ),
          ],
        ),
      ),
    );
  }
}
