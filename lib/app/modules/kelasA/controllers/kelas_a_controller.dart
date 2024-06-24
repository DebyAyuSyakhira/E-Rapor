import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KelasAController extends GetxController {
  // RxList untuk menyimpan daftar murid kelas A
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<DocumentSnapshot> murid_a = <DocumentSnapshot>[].obs;
  String idKelasA = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // Fungsi untuk mengambil data murid kelas A dari Firestore
  void fetchData() async {
    try {
      _firestore
          .collection('student')
          .where("student_class_id", isEqualTo: idKelasA)
          .snapshots()
          .listen((snapshot) {
        murid_a.value = snapshot.docs;
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
