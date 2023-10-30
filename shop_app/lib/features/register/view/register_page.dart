import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shop_app.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = 'login/register_page';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RegisterBloc(
          authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
        );
      },
      child: const RegisterBodyPage(),
    );
  }
}

class RegisterBodyPage extends StatelessWidget {
  const RegisterBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appLogo(),
              _registerInstruction(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.045),
              // CustomUserNameInputWidget(
              //   onChangeCallBack: (userName) {
              //     context
              //         .read<RegisterBloc>()
              //         .add(RegisterUsernameChanged(userName));
              //   },
              // ),
              // CustomEmailInputWidget(
              //   onChangeCallBack: (email) {
              //     context.read<RegisterBloc>().add(RegisterEmailChanged(email));
              //   },
              //   isRegister: true,
              // ),
              CustomPhoneNumberInputWidget(
                onChangeCallBack: (phoneNumber) {
                  // context
                  //     .read<RegisterBloc>()
                  //     .add(RegisterPhoneChanged(phoneNumber));
                  context.read<RegisterBloc>().add(RegisterPhoneChanged(phoneNumber));
                },
              ),
              // CustomPasswordInputWidget(
              //   onChangeCallBack: (password) {
              //     // context
              //     //     .read<RegisterBloc>()
              //     //     .add(RegisterPasswordChanged(password));
              //   },
              //   isRegister: true,
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const RegisterButtonWidget(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const AlreadyHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appLogo() {
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

  Widget _registerInstruction() {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.paddingMedium,
      ),
      child: const Column(
        children: [
          Text(
            'Create An Account',
            style: CustomTextStyle.textStyle18BlackW800,
          ),
          SizedBox(height: Dimensions.paddingDefault),
          Text(
            'Register with your active phone number \n or login your account',
            style: CustomTextStyle.textStyle16Grey600W400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
