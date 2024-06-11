import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NilaiAController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<DocumentSnapshot?> muridA =
      Rx<DocumentSnapshot?>(null); // Menggunakan tipe data tunggal

  @override
  void onInit() {
    super.onInit();
    fetchMurid(); // Panggil fetchMurid saat controller diinisialisasi
  }

  void fetchMurid() {
    _firestore
        .collection('murid_a')
        .doc('id')
        .snapshots()
        .listen((snapshot) {
      muridA.value = snapshot; // Menggunakan nilai tunggal daripada daftar
    });
  }

  var selectedSemester = ''.obs; // Observable variable for selected semester
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
      await firestore.collection('rapor_a').add({
        'selectedSemester': selectedSemester.value, // Add selected semester
        'agama': agama,
        'motorik': motorik,
        'kognitif': kognitif,
        'sosial': sosial,
        'bahasa': bahasa,
        'seni': seni,
        'beratBadan': beratBadan,
        'tinggi': tinggiBadan,
        'izin': izin,
        'sakit': sakit,
        'tanpaKeterangan': tanpaKeterangan
      });
      Get.back();
      Get.snackbar('Success', 'Data added successfully');

      selectedSemester.value = ''; // Clear selected semester
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
  void onClose() {
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
