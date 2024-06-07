import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.ADD_MURID);
              },
              child: const Text("Tambah Data"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.EDIT_MURID);
              },
              child: const Text("Edit Data"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.KELOLA_RAPOR);
              },
              child: const Text("Kelola Rapor"),
            ),
          ],
        ),
      ),
    );
  }
}
