import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AppLogoWidget(),
                  const LoginInstructionWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                  shared_module.CustomEmailInputWidget(
                    onChangeCallBack: (email) {
                      context.read<LoginBloc>().add(LoginEmailChanged(email));
                    },
                  ),
                  shared_module.CustomPasswordInputWidget(
                    onChangeCallBack: (password) {
                      context
                          .read<LoginBloc>()
                          .add(LoginPasswordChanged(password));
                    },
                  ),
                  const RememberMeWidget(),
                  const LoginButtonWidget(),
                  const ForgotPasswordWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  _orContinueWith(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const LoginWithGoogleAccountWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const RegisterAccountWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orContinueWith(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(
          shared_module.Dimensions.paddingDefault,
        ),
        alignment: Alignment.center,
        child: Text(
          AppLocalizations.of(context)!.or_continue_with,
          style: shared_module.CustomTextStyle.textStyle16Grey400W500,
        ),
      );
  } 
}

@visibleForTesting
class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(
        shared_module.Dimensions.paddingDefault,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          const SizedBox(width: 5.0),
          const Text(
            'Thao Nguyen',
            style: shared_module.CustomTextStyle.textStyle16BlackW700,
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
class LoginInstructionWidget extends StatelessWidget {
  const LoginInstructionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        shared_module.Dimensions.paddingMedium,
      ),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.login_your_account,
            style: shared_module.CustomTextStyle.textStyle18BlackW800,
          ),
          const SizedBox(height: shared_module.Dimensions.paddingDefault),
          Text(
            AppLocalizations.of(context)!.login_msg,
            style: shared_module.CustomTextStyle.textStyle16Grey600W400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
