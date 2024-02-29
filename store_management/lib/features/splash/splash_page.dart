import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WaitingScreen();
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

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
              key: const Key('BoxDecorationWithSplashPage'),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 163, 233, 166),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF66BB6A),
                    blurRadius: 96,
                  ),
                ],
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            const SizedBox(height: 100),
            const LinearProgressIndicator(
              color: Color.fromARGB(255, 172, 224, 175),
              backgroundColor: Color(0xFF66BB6A),
            ),
          ],
        ),
      ),
    ));
  }
}
