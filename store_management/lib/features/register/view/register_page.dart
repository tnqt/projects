import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

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
              _registerInstruction(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.045),
              shared_module.CustomUserNameInputWidget(
                onChangeCallBack: (userName) {
                  context
                      .read<RegisterBloc>()
                      .add(RegisterUsernameChanged(userName));
                },
              ),
              shared_module.CustomEmailInputWidget(
                onChangeCallBack: (email) {
                  context.read<RegisterBloc>().add(RegisterEmailChanged(email));
                },
                isRegister: true,
              ),
              shared_module.CustomPhoneInputWidget(
                onChangeCallBack: (phoneNumber) {
                  context
                      .read<RegisterBloc>()
                      .add(RegisterPhoneChanged(phoneNumber));
                },
              ),
              shared_module.CustomPasswordInputWidget(
                onChangeCallBack: (password) {
                  context
                      .read<RegisterBloc>()
                      .add(RegisterPasswordChanged(password));
                },
                isRegister: true,
              ),
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

  Widget _registerInstruction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        shared_module.Dimensions.paddingMedium,
      ),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.create_an_account,
            style: shared_module.CustomTextStyle.textStyle18BlackW800,
          ),
          const SizedBox(height: shared_module.Dimensions.paddingDefault),
          Text(
            AppLocalizations.of(context)!.register_msg,
            style: shared_module.CustomTextStyle.textStyle16Grey600W400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
