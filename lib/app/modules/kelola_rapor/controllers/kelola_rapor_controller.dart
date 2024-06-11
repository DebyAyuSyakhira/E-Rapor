import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaRaporController extends GetxController {
  // dropdown belum disetting
  // late TextEditingController selectedsemesterController = TextEditingController();
  late TextEditingController agamaController = TextEditingController();
  late TextEditingController motorikController = TextEditingController();
  late TextEditingController kognitifController = TextEditingController();
  late TextEditingController sosialController = TextEditingController();
  late TextEditingController bahasaController = TextEditingController();
  late TextEditingController seniController = TextEditingController();
  late TextEditingController beratBadanController = TextEditingController();
  late TextEditingController tinggiBadanController = TextEditingController();
  late TextEditingController izinController = TextEditingController();
  late TextEditingController sakitController = TextEditingController();
  late TextEditingController tanpaKeteranganController =
      TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(
      // dropdown belum disetting
      // String selectedsemester,
      String agama,
      String motorik,
      String kognitif,
      String sosial,
      String bahasa,
      String seni,
      String beratBadan,
      String tinggiBadan,
      String izin,
      String sakit,
      String tanpaKeterangan) async {
    try {
      await firestore.collection('rapor').add({
        // dropdown belum disetting
        // 'selectedsemester': selectedsemester,
        'agama': agama, 'motorik': motorik, 'kognitif': kognitif,
        'sosial': sosial, 'bahasa': bahasa, 'seni': seni,
        'beratBadan': beratBadan, 'tinggi': tinggiBadan,
        'izin': izin, 'sakit': sakit, 'tanpaKeterangan': tanpaKeterangan
      });
      Get.back();
      Get.snackbar('Success', 'Data added successfully');
      // dropdown belum disetting

      // selectedsemesterController.clear();
      agamaController.clear();
      motorikController.clear();
      kognitifController.clear();
      sosialController.clear();
      bahasaController.clear();
      seniController.clear();
      beratBadanController.clear();
      tinggiBadanController.clear();
      izinController.clear();
      sakitController.clear();
      tanpaKeteranganController.clear();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // dropdown belum disetting
    // selectedsemesterController = TextEditingController();
    agamaController = TextEditingController();
    motorikController = TextEditingController();
    kognitifController = TextEditingController();
    sosialController = TextEditingController();
    bahasaController = TextEditingController();
    seniController = TextEditingController();
    beratBadanController = TextEditingController();
    izinController = TextEditingController();
    sakitController = TextEditingController();
    tanpaKeteranganController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // dropdown belum disetting
    // selectedsemesterController.dispose();
    agamaController.dispose();
    motorikController.dispose();
    kognitifController.dispose();
    sosialController.dispose();
    bahasaController.dispose();
    seniController.dispose();
    beratBadanController.dispose();
    izinController.dispose();
    sakitController.dispose();
    tanpaKeteranganController.dispose();
    super.onClose();
  }
}
