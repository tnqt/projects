import 'package:flutter/material.dart';
import 'package:shop_app/shop_app.dart';
// import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  // static Route route() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => const LoadingPage(),
  //     transitionsBuilder: (_, anim, __, child) =>
  //         FadeTransition(opacity: anim, child: child),
  //     transitionDuration: const Duration(milliseconds: 400),
  //   );
  // }

  static const routeName = "/loading";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HomeService.prepareResource(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingResourceScreen();
          } else {
            // return const DashboardPage();
            // return Container();
            return const WaitingResourceScreen();
          }
        });
  }
}

@visibleForTesting
class WaitingResourceScreen extends StatelessWidget {
  const WaitingResourceScreen({Key? key}) : super(key: key);

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/shop_logo.png'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Prepare the resource"),
            const SizedBox(height: 20),
            const LinearProgressIndicator(),
          ],
        ),
      ),
    ));
  }
}
