import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KelasBController extends GetxController {
  // RxList untuk menyimpan daftar murid kelas B
  RxList<DocumentSnapshot> murid_b = <DocumentSnapshot>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Panggil fungsi untuk mengambil data murid kelas B dari Firestore saat kontroller diinisialisasi
    fetchData();
  }

  // Fungsi untuk mengambil data murid kelas B dari Firestore
  void fetchData() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('murid_b')
          .get(); // Ambil semua dokumen dari koleksi 'murid_b'
      murid_b.value = querySnapshot
          .docs; // Set nilai RxList murid_b dengan dokumen-dokumen yang diperoleh
    } catch (error) {
      print('Error while fetching data: $error');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
