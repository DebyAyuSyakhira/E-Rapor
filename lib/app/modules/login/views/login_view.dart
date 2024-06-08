import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginView({super.key});

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
                  "Masuk",
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
                  "Masuk dengan isi data berikut",
                  style: TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    customTextFormField(
                      textEditingController: controller.emailController,
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 30),
                    customTextFormField(
                      textEditingController: controller.passwordController,
                      hintText: "Kata Sandi",
                      isTextObscured: true,
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login(
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                            );
                          }
                        },
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
                          "Masuk",
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
                        Get.toNamed(Routes.RESET_PASSWORD);
                      },
                      child: const Text(
                        "Lupa kata sandi?",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 135, 27, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(0, 135, 27, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Belum punya akun? ",
                          style: TextStyle(
                            color: Color(0xFF424242),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 135, 27, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromRGBO(0, 135, 27, 1),
                            ),
                          ),
                        ),
                      ],
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
