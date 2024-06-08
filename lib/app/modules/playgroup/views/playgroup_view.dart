import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/playgroup_controller.dart';

class PlaygroupView extends GetView<PlaygroupController> {
  const PlaygroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAFTAR MURID PLAYGROUP'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
        backgroundColor: const Color(0xFF00871B), // Warna latar belakang AppBar
      ),
      body: ListView(), // Halaman kosong
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/add-murid");
          // Aksi saat tombol ditekan
          print('Floating button ditekan');
        },
        backgroundColor:
            const Color.fromARGB(255, 244, 221, 10),
        child: const Icon(Icons.add, color: Colors.white, size: 40,), // Warna tombol floating
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}