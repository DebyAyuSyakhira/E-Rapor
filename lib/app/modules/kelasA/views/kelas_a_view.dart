import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kelas_a_controller.dart';

class KelasAView extends GetView<KelasAController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DAFTAR MURID KELAS A'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
        backgroundColor: Colors.green, // Warna latar belakang AppBar
      ),
      body: Container(), // Halaman kosong
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/add-murid");
          // Aksi saat tombol ditekan
          print('Floating button ditekan');
        },
        child: Icon(Icons.add),
        backgroundColor:
            Color.fromARGB(255, 244, 221, 10), // Warna tombol floating
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
