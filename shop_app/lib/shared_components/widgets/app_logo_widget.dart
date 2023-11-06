import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';

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
            height: 100,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/icons/shop_logo.png'),
            ),
          ),
          const SizedBox(width: 5.0),
          const Text(
            'Thao Nguyen',
            style: CustomTextStyle.textStyle24BlackW700,
          ),
        ],
      ),
    );
  }
}
