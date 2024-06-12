import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaygroupController extends GetxController {
  // RxList untuk menyimpan daftar murid kelas B
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<DocumentSnapshot> murid_c = <DocumentSnapshot>[].obs;
  String idPlaygroup = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    // Panggil fungsi untuk mengambil data murid kelas B dari Firestore saat kontroller diinisialisasi
    fetchData();
  }

  // Fungsi untuk mengambil data murid kelas B dari Firestore
  void fetchData() async {
    try {
      // print(idPlaygroup);
      _firestore
          .collection('student')
          .where("student_class_id", isEqualTo: idPlaygroup)
          .snapshots()
          .listen((snapshot) {
        murid_c.value = snapshot.docs;
      });
      // final QuerySnapshot querySnapshot = await _firestore
      //     .collection('student')
      //     .where("student_class_id", isEqualTo: idPlaygroup)
      //     .get();
      //   murid_c.value = querySnapshot.docs;
    } catch (error) {
      print('Error while fetching data: $error');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
