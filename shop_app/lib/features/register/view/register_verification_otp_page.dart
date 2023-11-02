import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:shop_app/shop_app.dart';

class RegisterVerificationOtpPage extends StatefulWidget {
  const RegisterVerificationOtpPage({super.key});

  static const routeName = "register/register_verification_otp_page";

  @override
  State<RegisterVerificationOtpPage> createState() =>
      _RegisterVerificationOtpPageState();
}

class _RegisterVerificationOtpPageState
    extends State<RegisterVerificationOtpPage> {
  TextEditingController txtOTPCode = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: '',
        height: MediaQuery.of(context).size.height > 812 ? 31 : 58,
        backgroundColor: const Color(0xFFF6F6F6),
        leadingColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppLogoWidget(),
              _verificationOtpInstruction(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verificationOtpInstruction() {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.paddingMedium,
      ),
      child: Column(
        children: [
          const Text(
            'OTP Authentication',
            style: CustomTextStyle.textStyle18BlackW800,
          ),
          const SizedBox(height: Dimensions.paddingDefault),
          const Text(
            'Input OTP sent to this phone number',
            style: CustomTextStyle.textStyle16Grey600W400,
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Pinput(
              key: const Key("RegisterOtpPinInput"),
              length: 6,
              enabled: true,
              keyboardType: Platform.isIOS
                  ? const TextInputType.numberWithOptions(
                      signed: true, decimal: true)
                  : TextInputType.phone,
              autofocus: true,
              controller: txtOTPCode,
              focusNode: focusNode,
              // defaultPinTheme: defaultPinTheme,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              closeKeyboardWhenCompleted: false,
              validator: (value) {
                return null;
              },
              onClipboardFound: (value) {},
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {},
              onChanged: (value) {},
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: const Color(0xFF66BB6A),
                  ),
                ],
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (val) async {
                FirebaseLogger().log("action_otp_authentication_continue", "");
                if (txtOTPCode.text.length < 6) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => CustomIOSDialog(
                      title: "",
                      dialogType: CustomDialogType.error,
                      body: Container(
                        padding: const EdgeInsets.all(
                          Dimensions.paddingSmall,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Not enough OTP',
                          style: CustomTextStyle.textStyle14BlackW400,
                        ),
                      ),
                      btnOkOnPress: () => Navigator.of(context).pop(),
                      btnCancelOnPress: () {},
                    ),
                  );
                } else {
                  context
                      .read<RegisterBloc>()
                      .add(RegisterOtpChanged(txtOTPCode.text));
                }
              },
            ),
          ),
          // CustomButtonWidget.buildRaisedButton(
          //     btnText: "Continue",
          //     onPress: () {
          //       // context.read<RegisterBloc>().add(const RegisterSubmitted());
          //       // Navigator.pushNamed(
          //       //     context, RegisterVerificationOtpPage.routeName);
          //     }),
          CustomButtonWidget.buildLargeButton(
            btnText: "Continue",
            onPress: () {
              context
                  .read<RegisterBloc>()
                  .add(const RegisterOtpSubmitted());
            },
          ),
        ],
      ),
    );
  }
}
