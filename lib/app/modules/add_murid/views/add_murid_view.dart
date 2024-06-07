import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_murid_controller.dart';

class AddMuridView extends GetView<AddMuridController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddMuridView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.07,
                    vertical: size.height * 0.12),
                children: [
                  const Text(
                    "Tambah Data Murid",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 135, 27, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Silakan lengkapi formulir berikut",
                    style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        customTextFormField(
                          textEditingController: controller.namaMuridController,
                          hintText: "Nama Murid",
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 30),
                        customTextFormField(
                          textEditingController:
                              controller.nomorIndukController,
                          hintText: "Nomor Induk",
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 30),
                        customTextFormField(
                          textEditingController: controller.usiaController,
                          hintText: "Usia",
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(0, 135, 27, 1),
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
                              "SIMPAN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 0, 135, 27)),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container customTextFormField({
    required TextEditingController textEditingController,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool isTextObscured = false,
  }) {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: isTextObscured,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hintText Formulir tidak boleh ada yang kosong";
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
