import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMuridController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController namaMuridController = TextEditingController();
  final TextEditingController nomorIndukController = TextEditingController();
  final TextEditingController usiaController = TextEditingController();

  final RxList<DocumentSnapshot> muridA = <DocumentSnapshot>[].obs;
  final RxList<DocumentSnapshot> muridB = <DocumentSnapshot>[].obs;
  final RxList<DocumentSnapshot> muridC = <DocumentSnapshot>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMuridA();
    fetchMuridB();
  }

  Future<void> fetchMuridA() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('murid_a').get();
      muridA.value = querySnapshot.docs;
    } catch (error) {
      print('Error fetching murid for class A: $error');
    }
  }

  Future<void> fetchMuridB() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('murid_b').get();
      muridB.value = querySnapshot.docs;
    } catch (error) {
      print('Error fetching murid for class B: $error');
    }
  }

  Future<void> fetchMuridC() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('murid_b').get();
      muridB.value = querySnapshot.docs;
    } catch (error) {
      print('Error fetching murid for class B: $error');
    }
  }

  Future<void> saveDataToFirestore(String studentClassId) async {
    try {
      await _firestore.collection("student").add({
        "student_class_id ": studentClassId,
        "name": namaMuridController.text,
        "id_number": nomorIndukController.text,
        "age": usiaController.text,
      });

      namaMuridController.clear();
      nomorIndukController.clear();
      usiaController.clear();

      Get.back();
      Get.snackbar('Berhasil', 'Data murid berhasil disimpan',
          snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      print('Error saat menyimpan data murid: $error');
      Get.snackbar('Error', 'Terjadi kesalahan saat menyimpan data murid',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> saveDataToFirestoreB() async {
    try {
      await _firestore.collection('murid_b').add({
        'nama': namaMuridController.text,
        'nomor_induk': nomorIndukController.text,
        'usia': usiaController.text,
      });

      namaMuridController.clear();
      nomorIndukController.clear();
      usiaController.clear();

      Get.back();
      Get.snackbar('Berhasil', 'Data murid berhasil disimpan ke kelas B',
          snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      print('Error saat menyimpan data murid ke kelas B: $error');
      Get.snackbar(
          'Error', 'Terjadi kesalahan saat menyimpan data murid ke kelas B',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> saveDataToFirestoreC() async {
    try {
      await _firestore.collection('murid_c').add({
        'nama': namaMuridController.text,
        'nomor_induk': nomorIndukController.text,
        'usia': usiaController.text,
      });

      namaMuridController.clear();
      nomorIndukController.clear();
      usiaController.clear();

      Get.back();
      Get.snackbar('Berhasil', 'Data murid berhasil disimpan ke kelas B',
          snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      print('Error saat menyimpan data murid ke kelas B: $error');
      Get.snackbar(
          'Error', 'Terjadi kesalahan saat menyimpan data murid ke kelas B',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
