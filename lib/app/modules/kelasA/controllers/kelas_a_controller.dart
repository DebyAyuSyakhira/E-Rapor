import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KelasAController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<List<DocumentSnapshot>> muridA = Rx<List<DocumentSnapshot>>([]);
  String idA = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    fetchMurid(); // Panggil fetchMurid saat controller diinisialisasi
  }

  void fetchMurid() async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection('student')
          .where("student_class_id", isEqualTo: idA)
          .get();
      muridA.value = querySnapshot.docs;
    } catch (error) {
      print('Error while fetching data: $error');
    }
}
}