import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uml_project/utils/colour/global_color.dart';

import 'login_page.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginPage(onTap: () {},));
    });
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: const Center(
        child: Text(
          'A G I T E L',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
