import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../register/controllers/register_controller.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final RegisterController _registerController = Get.put(RegisterController());
  var isPasswordVisible = true.obs;

  void clearInputText() {
    emailController.clear();
    passwordController.clear();
  }

  void login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.emailVerified) {
          customSnackBar(
            "Sukses", 
            "Pengguna berhasil masuk"
          );
          Get.offAllNamed(Routes.HOME);
          _registerController.clearInputText();
        } else {
          customSnackBar(
            "Error", 
            "Mohon verifikasi email Anda"
          );
        }
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        customSnackBar(
          "Gagal",
          "Tidak ditemukan pengguna untuk email tersebut.",
        );
      } else if (error.code == "invalid-email") {
        customSnackBar(
          "Gagal",
          "Alamat email diformat dengan buruk.",
        );
      } else if (error.code == "wrong-password") {
        customSnackBar(
          "Gagal",
          "Kata sandi yang diberikan salah.",
        );
      } else if (error.code == "invalid-credential") {
        customSnackBar(
          "Gagal",
          "Email atau Kata Sandi tidak valid. Silakan coba lagi",
        );
      } else if (error.code == "too-many-requests") {
        customSnackBar(
          "Gagal",
          "Terlalu banyak permintaan. Coba lagi nanti.",
        );
      } else {
        customSnackBar(
          "Gagal",
          "Penyebab kesalahan tidak diketahui.",
        );
      }
    }
  }

  void customSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      colorText: Colors.white,
      backgroundColor: title == "Gagal"
          ? Colors.red
          : title == "Berhasil"
              ? Colors.green
              : Colors.grey,
    );
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
