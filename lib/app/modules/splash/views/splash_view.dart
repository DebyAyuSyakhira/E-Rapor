import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>().checkAuthStatus();
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("images/bg_top.png", fit: BoxFit.contain),
            ),
            SizedBox(
                child: Image.asset("images/logo_splash.png")),
            SizedBox(
                width: double.maxFinite,
                child: Image.asset(
                  "images/bg.png",
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ))
          ]),
    );
  }
}
