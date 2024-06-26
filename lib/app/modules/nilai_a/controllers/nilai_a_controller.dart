import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NilaiAController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> data = {};

  // Rx<DocumentSnapshot?> muridA =
  //     Rx<DocumentSnapshot?>(null); // Menggunakan tipe data tunggal
  String idMurid = Get.arguments;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // // if
  //   // // (Get.arguments != null) {
  //   // //   idMurid = Get.arguments as String;
  //   //   fetchMurid();}
  //     fetchMurid();
  //     print(idMurid);
  //    // Panggil fetchMurid saat controller diinisialisasi
  // }

  Future<void> fetchMurid() async {
    DocumentSnapshot doc =
        await _firestore.collection('student').doc(idMurid).get();
    data = doc.data() as Map<String, dynamic>;
    // print(doc.data() as Map<String, dynamic>);
    print(data["name"]);
    print(data["id_number"]);
    print(data["age"]);

    if (selectedSemester.value.isNotEmpty) {
      final raporDoc = (await _firestore
        .collection('student_report')
        .where('student_id', isEqualTo: idMurid) 
        .where('semester', isEqualTo: selectedSemester.value)
        .get())
        .docs
        .firstOrNull; //ngambil doc pertama dari hasil query, klo null berarti ga cocok sma kriteria.

      agamaController.text = raporDoc?['religious_and_moral_values_development'] ?? '';
      motorikController.text = raporDoc?['physical_development'] ?? '';
      kognitifController.text = raporDoc?['cognitive_development'] ?? '';
      sosialController.text = raporDoc?['social_emotional_development'] ?? '';
      bahasaController.text = raporDoc?['language_development'] ?? '';
      seniController.text = raporDoc?['artistic_development'] ?? '';
      beratBadanController.text = raporDoc?['body_weight'] ?? '';
      tinggiBadanController.text = raporDoc?['body_height'] ?? '';
      izinController.text = raporDoc?['number_of_permit_days'] ?? '';
      sakitController.text = raporDoc?['number_of_sick_days'] ?? '';
      tanpaKeteranganController.text = raporDoc?['number_of_days_without_information'] ?? '';
    }
    
  }

  var selectedSemester = ''.obs; 
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
      final QuerySnapshot querySnapshot = await _firestore
          .collection('student_report')
          .where('student_id', isEqualTo: idMurid)
          .where('semester', isEqualTo: selectedSemester.value)
          .get();
      print(querySnapshot);

      final bool isexists = querySnapshot.docs.isNotEmpty;
      print(isexists);
      if (isexists) {
        final String idrapor = querySnapshot.docs.first.id;
        await firestore.collection('student_report').doc(idrapor).update({
          'student_id': idMurid,
          'semester': selectedSemester.value,
          'religious_and_moral_values_development': agama,
          'physical_development': motorik,
          'cognitive_development': kognitif,
          'social_emotional_development': sosial,
          'language_development': bahasa,
          'artistic_development': seni,
          'body_weight': beratBadan,
          'body_height': tinggiBadan,
          'number_of_permit_days': izin,
          'number_of_sick_days': sakit,
          'number_of_days_without_information': tanpaKeterangan
        });
      } else {
        await firestore.collection('student_report').add({
          'student_id': idMurid,
          'semester': selectedSemester.value, 
          'religious_and_moral_values_development': agama,
          'physical_development': motorik,
          'cognitive_development': kognitif,
          'social_emotional_development': sosial,
          'language_development': bahasa,
          'artistic_development': seni,
          'body_weight': beratBadan,
          'body_height': tinggiBadan,
          'number_of_permit_days': izin,
          'number_of_sick_days': sakit,
          'number_of_days_without_information': tanpaKeterangan
        });
      }

      Get.back();
      Get.snackbar('Success', 'Data added successfully');

      selectedSemester.value = ''; 
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
