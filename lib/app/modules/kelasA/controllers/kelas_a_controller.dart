import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KelasAController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<List<DocumentSnapshot>> muridA = Rx<List<DocumentSnapshot>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchMurid(); // Panggil fetchMurid saat controller diinisialisasi
  }

  void fetchMurid() {
    _firestore.collection('murid_a').snapshots().listen((snapshot) {
      muridA.value = snapshot.docs;
    });
  }
}
