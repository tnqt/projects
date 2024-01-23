import 'package:flutter/material.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/shared_components/style/custom_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          'Hello World from Thao Nguyen owner',
          style: CustomTextStyle.textStyleDefault,
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
