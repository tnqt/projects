import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: DashboardAppBarWidget(
      //   preferredSizeHeight: 100,
      //   appBarHeightFromTop:
      //       MediaQuery.of(context).size.height > 812 ? 100 : 70,
      //   topPadding: MediaQuery.of(context).size.height > 812 ? 50 : 25,
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}