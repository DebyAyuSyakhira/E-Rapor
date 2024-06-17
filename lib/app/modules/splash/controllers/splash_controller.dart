import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_rapor/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkAuthStatus();
  }

  void checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 5));
    
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
