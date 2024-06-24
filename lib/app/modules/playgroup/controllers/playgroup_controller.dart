import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaygroupController extends GetxController {
  // RxList untuk menyimpan daftar murid kelas Playgroup
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<DocumentSnapshot> murid_c = <DocumentSnapshot>[].obs;
  String idPlaygroup = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // Fungsi untuk mengambil data murid kelas Playgroup dari Firestore
  void fetchData() async {
    try {
      _firestore
          .collection('student')
          .where("student_class_id", isEqualTo: idPlaygroup)
          .snapshots()
          .listen((snapshot) {
        murid_c.value = snapshot.docs;
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
