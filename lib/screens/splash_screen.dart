import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/home_screen.dart';

import '../controller/question_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    final controller = Get.put(QuestionController());
      controller.displayQuestion();

    Timer(Duration(seconds: 3), () =>Get.to(()=> HomeScreen()));
  }
}
