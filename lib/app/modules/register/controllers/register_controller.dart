import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_rapor/app/data/user_model.dart';
import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection("users");
      
  var username = ''.obs;
  var isPasswordVisible = true.obs;

  // @override
  // void onClose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   phoneNumberController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  void clearInputText() {
    nameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
  }

  void register({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        phoneNumber: phoneNumber,
        email: email,
      );
      _userReference.doc(user.id).set(user.toJson());
      username.value = name;
      
      // customSnackBar(
      //   "Berhasil",
      //   "Akun Anda berhasil dibuat.",
      // );
      userCredential.user!.sendEmailVerification();
        Get.defaultDialog(
          title: 'Verify your email',
          middleText:'Please verify your email to continue. We have sent you an email verification link.',
          textConfirm: 'OK',
          textCancel: 'Resend',
          buttonColor: const Color.fromRGBO(0, 135, 27, 1),
          confirmTextColor: Colors.black,
          onConfirm: () {
            Get.offAllNamed(Routes.LOGIN);
            clearInputText();
          },
          onCancel: () {
            userCredential.user!.sendEmailVerification();
            customSnackBar('Success', 'Email verification link sent');
          },
        );
    } on FirebaseAuthException catch (error) {
      if (error.code == "weak-password") {
        customSnackBar(
          "Gagal",
          "Kata sandi yang diberikan terlalu lemah.",
        );
      } else if (error.code == "invalid-email") {
        customSnackBar(
          "Gagal",
          "Alamat email diformat dengan buruk.",
        );
      } else if (error.code == "email-already-in-use") {
        customSnackBar(
          "Gagal",
          "Akun sudah ada untuk email tersebut.",
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

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}