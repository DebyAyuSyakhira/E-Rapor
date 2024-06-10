import 'package:e_rapor/app/modules/add_murid/controllers/add_murid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMuridBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMuridController>(() => AddMuridController());
  }
}
