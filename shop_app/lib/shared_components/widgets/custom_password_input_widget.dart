import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shop_app/shop_app.dart';

class CustomPasswordInputWidget extends StatefulWidget {
  const CustomPasswordInputWidget({
    Key? key,
    required this.onChangeCallBack,
    this.isRegister = false,
  }) : super(key: key);

  final Function(String password) onChangeCallBack;
  final bool isRegister;

  @override
  State<StatefulWidget> createState() => CustomPasswordInputWidgetState();
}

class CustomPasswordInputWidgetState extends State<CustomPasswordInputWidget> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Util.getRememberMeModel(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            RememberMeModel rememberMeModel = snapShot.data is RememberMeModel
                ? (snapShot.data as RememberMeModel)
                : RememberMeModel.empty;
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingDefault,
                vertical: Dimensions.paddingMedium,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
                color: Colors.white70,
                // border: Border.all(
                //   color: Color(0xFFEFEFEF),
                // ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .08),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: TextFormField(
                key: const Key('CustomPasswordInputWidget'),
                initialValue: widget.isRegister ? "" : rememberMeModel.password,
                onChanged: (value) => widget.onChangeCallBack(value),
                obscureText: !_passwordVisible,
                decoration: decorationForInputTextField(
                    hintText: 'Password',
                    hintStyle: CustomTextStyle.textStyle16Grey350W400,
                    prefixIcon: const Icon(
                      Icons.lock,
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
                    isSuffixIcon: true,
                    suffixIcon: IconButton(
                      icon: _passwordVisible
                          ? Icon(
                              MdiIcons.eyeOutline,
                              color: const Color(0xFF66BB6A),
                            )
                          : Icon(MdiIcons.eyeOffOutline,
                              color: const Color(0xFF66BB6A)),
                      onPressed: () {
                        setState(() {
                          _passwordVisible ^=
                              true; // Xor bit - refer: https://en.wikipedia.org/wiki/Bitwise_operation
                        });
                      },
                    )),
                textAlignVertical: TextAlignVertical.center,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    widget.onChangeCallBack(value);
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
