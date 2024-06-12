import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditMuridController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController namaMuridController = TextEditingController();
  final TextEditingController nomorIndukController = TextEditingController();
  final TextEditingController usiaController = TextEditingController();

  String docId = '';

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      docId = Get.arguments as String;
      fetchMuridData();
    }
  }

  void fetchMuridData() async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('student').doc(docId).get();
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      namaMuridController.text = data['name'];
      nomorIndukController.text = data['id_number'];
      usiaController.text = data['age'];
    } catch (error) {
      print('Error fetching murid data: $error');
    }
  }

  Future<void> updateDataInFirestore() async {
    try {
      await _firestore.collection("student").doc(docId).update({
        "name": namaMuridController.text,
        "id_number": nomorIndukController.text,
        "age": usiaController.text,
      });

      namaMuridController.clear();
      nomorIndukController.clear();
      usiaController.clear();

      Get.back();
      Get.snackbar('Berhasil', 'Data murid berhasil diperbarui',
          snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      print('Error saat memperbarui data murid: $error');
      Get.snackbar('Error', 'Terjadi kesalahan saat memperbarui data murid',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> deleteDataFromFirestore() async {
    try {
      await _firestore.collection("student").doc(docId).delete();

      namaMuridController.clear();
      nomorIndukController.clear();
      usiaController.clear();

      Get.back();
      Get.snackbar('Berhasil', 'Data murid berhasil dihapus',
          snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      print('Error saat menghapus data murid: $error');
      Get.snackbar('Error', 'Terjadi kesalahan saat menghapus data murid',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
