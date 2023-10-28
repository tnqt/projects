import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "splash_screen";

  const SplashScreen({Key? key}) : super(key: key);

  // Future<void> requestPermission(BuildContext context) async {
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   navigator(context);
  // }

  // Future<void> navigator(BuildContext context) async {
  //   final bool isLogin = true;
  //   if (isLogin) {
  //     WidgetsBinding.instance!.addPostFrameCallback((_) {
  //       Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
  //       // Navigator.of(context).pushReplacementNamed(LoadingPage.routeName);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/icons/shop_logo.png"),
                    ),
                  ),
                )
              ]),
        ),
        // child: FutureBuilder(
        //   future: requestPermission(context),
        //   builder: (context, snapshot) {
        //     return Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //         Container(
        //           // width: Get.width * 0.2,
        //           width: MediaQuery.of(context).size.width * 0.2,
        //           // height: Get.height * 0.2,
        //           height: MediaQuery.of(context).size.height * 0.2,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             image: DecorationImage(
        //               image: AssetImage("assets/icons/shop_logo.png"),
        //             ),
        //           ),
        //         )
        //       ]),
        //     );
        //   },
        // ),
      ),
    );
  }
}
