import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shop_app.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = 'register/register_page';

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
              const AppLogoWidget(),
              _registerInstruction(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.045),
              CustomPhoneNumberInputWidget(
                onChangeCallBack: (phoneNumber) {
                  context
                      .read<RegisterBloc>()
                      .add(RegisterPhoneChanged(phoneNumber));
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButtonWidget.buildLargeButton(
                  onPress: () {
                    // context.read<RegisterBloc>().add(const RegisterSubmitted());
                    Navigator.pushNamed(
                        context, RegisterVerificationOtpPage.routeName);
                  },
                  btnText: "Register"),
              // const RegisterButtonWidget(),
              // CustomButtonWidget.buildRaisedButton(
              //     btnText: "Register",
              //     onPress: () {
              //       context.read<RegisterBloc>().add(const RegisterSubmitted());
              //       Navigator.pushNamed(
              //           context, RegisterVerificationOtpPage.routeName);
              //     }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const AlreadyHaveAnAccountWidget(),
            ],
          ),
        ),
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
