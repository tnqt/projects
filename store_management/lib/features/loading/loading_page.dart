import 'package:flutter/material.dart';
import 'package:store_management/store_management.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  static const routeName = "/loading";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HomeService.prepareResource(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingResourceScreen();
          } else {
            return const LoadingPage();
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
                  image: AssetImage('assets/images/logo.png'),
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
