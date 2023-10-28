import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shop_app/shop_app.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == FormzStatus.submissionFailure) {
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
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045),
                  // CustomEmailInputWidget(
                  //   onChangeCallBack: (email) {
                  //     context.read<LoginBloc>().add(LoginEmailChanged(email));
                  //   },
                  // ),
                  // CustomPasswordInputWidget(
                  //   onChangeCallBack: (password) {
                  //     context
                  //         .read<LoginBloc>()
                  //         .add(LoginPasswordChanged(password));
                  //   },
                  // ),
                  const RememberMeWidget(),
                  const LoginButtonWidget(),
                  const ForgotPasswordWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  _orContinueWith,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // const LoginWithGoogleAccountWidget(),
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

  Widget get _orContinueWith => Container(
        margin: const EdgeInsets.all(
          Dimensions.paddingDefault,
        ),
        alignment: Alignment.center,
        child: const Text(
          '~ or continue with ~',
          style: CustomTextStyle.textStyle16Grey400W500,
        ),
      );
}

@visibleForTesting
class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(
        Dimensions.paddingDefault,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/icons/shop_logo.png'),
            ),
          ),
          const SizedBox(width: 5.0),
          const Text(
            'Thao Nguyen',
            style: CustomTextStyle.textStyle16BlackW700,
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
        Dimensions.paddingMedium,
      ),
      child: const Column(
        children: [
          Text(
            'login your account',
            style: CustomTextStyle.textStyle18BlackW800,
          ),
          SizedBox(height: Dimensions.paddingDefault),
          Text(
            'login msg',
            style: CustomTextStyle.textStyle16Grey600W400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
