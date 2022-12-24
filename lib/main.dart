import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uml_project/pages/login_page.dart';
import 'package:uml_project/pages/splash_view.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uml_projet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashView(),
    );
  }
}
