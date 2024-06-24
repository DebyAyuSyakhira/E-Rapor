import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KelasBController extends GetxController {
  // RxList untuk menyimpan daftar murid kelas B
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<DocumentSnapshot> murid_b = <DocumentSnapshot>[].obs;
  String idKelasB = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // Fungsi untuk mengambil data murid kelas B dari Firestore
  void fetchData() async {
    try {
      _firestore
          .collection('student')
          .where("student_class_id", isEqualTo: idKelasB)
          .snapshots()
          .listen((snapshot) {
        murid_b.value = snapshot.docs;
      });
    } catch (error) {
      print('Error while fetching data: $error');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
