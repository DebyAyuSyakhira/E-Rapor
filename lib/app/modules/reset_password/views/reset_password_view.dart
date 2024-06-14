import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.contain,
              alignment: Alignment.bottomLeft)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(30, 80, 30, 231),
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  bottom: 5,
                ),
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 135, 27, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  bottom: 30,
                ),
                child: Text(
                  "Ubah Password Anda",
                  style: TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                child: Image.asset("images/reset.png"),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    customTextFormField(
                      textEditingController: controller.emailController,
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.resetPassword(controller.emailController.text),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 135, 27, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              color: Color.fromRGBO(0, 135, 27, 1),
                              width: 2,
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignInside,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: const Text(
                        "Kembali",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 135, 27, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(0, 135, 27, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding customTextFormField({
    required TextEditingController textEditingController,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool isTextObscured = false,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: isTextObscured,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hintText tidak boleh kosong";
          }
          return null;
        },
        style: const TextStyle(
          color: Color.fromRGBO(0, 135, 27, 1),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 12),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(0, 135, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color.fromRGBO(0, 135, 27, 1),
              width: 2,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color.fromRGBO(0, 135, 27, 1),
              width: 2,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color.fromRGBO(0, 135, 27, 1),
              width: 2,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
        ),
      ),
    );
  }
}