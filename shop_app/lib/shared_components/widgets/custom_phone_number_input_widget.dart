import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

class CustomPhoneNumberInputWidget extends StatelessWidget {
  const CustomPhoneNumberInputWidget({
    Key? key,
    required this.onChangeCallBack,
    this.isRegister = false,
  }) : super(key: key);

  final Function(String phoneNumber) onChangeCallBack;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Util.getRememberMeModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            RememberMeModel data = snapshot.data is RememberMeModel
                ? (snapshot.data as RememberMeModel)
                : RememberMeModel.empty;
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingDefault,
                vertical: Dimensions.paddingMedium,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white70,
                border: Border.all(
                  color: const Color(0xFFEFEFEF),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .08),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: TextFormField(
                key: const Key('CustomPhoneNumberInputWidget'),
                initialValue: isRegister ? "" : data.phoneNumber,
                decoration: decorationForInputTextField(
                  hintText: 'Phone number',
                  hintStyle: CustomTextStyle.textStyle16Grey350W400,
                  prefixIcon: const Icon(
                    Icons.mobile_friendly,
                    color: Color(0xFF66BB6A),
                    size: 25,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.white70,
                      width: 1.0,
                    ),
                  ),
                ),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  onChangeCallBack(value);
                },
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    onChangeCallBack(value);
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
