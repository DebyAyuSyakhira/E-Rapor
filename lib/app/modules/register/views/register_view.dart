import 'package:e_rapor/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

class RegisterView extends GetView<RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterView({super.key});

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
            padding: const EdgeInsets.fromLTRB(30, 80, 30, 160),
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  bottom: 5,
                ),
                child: Text(
                  "Daftar",
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
                  "Daftar dengan isi data berikut",
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
                      textEditingController: controller.nameController,
                      hintText: "Nama",
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 30),
                    customTextFormField(
                      textEditingController: controller.phoneNumberController,
                      hintText: "Nomor Telepon",
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 30),
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
                            controller.register(
                              name: controller.nameController.text,
                              phoneNumber:
                                  controller.phoneNumberController.text,
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
                          "Daftar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sudah punya akun? ",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 135, 27, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Text(
                            "Masuk",
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
