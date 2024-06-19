import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int jumlahPlaygroup = 0;
  int jumlahA = 0;
  int jumlahB = 0;
  String idPlaygroup = "";
  String idA = "";
  String idB = "";
  var username = "".obs;

  @override
  void onInit() {
    fetch_playgroup();
    fetch_A();
    fetch_B();
    fetch_user();
    super.onInit();
  }

  Future<void> fetchdata() async {
    await fetch_playgroup();
    await fetch_A();
    await fetch_B();
    await fetch_user();
  }

  Future<void> fetch_playgroup() async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection('student_class')
          .where("name", isEqualTo: "Playgroup")
          .get();
      idPlaygroup = querySnapshot.docs.first.id;
      final Map data = querySnapshot.docs.first.data() as Map;
      jumlahPlaygroup = data["student_count"];
      print(jumlahPlaygroup);
    } catch (error) {
      print('Error fetching murid for class A: $error');
    }
  }

  Future<void> fetch_A() async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection('student_class')
          .where("name", isEqualTo: "Kelas A")
          .get();
      idA = querySnapshot.docs.first.id;
      final Map data = querySnapshot.docs.first.data() as Map;
      jumlahA = data["student_count"];
    } catch (error) {
      print('Error fetching murid for class A: $error');
    }
  }

  Future<void> fetch_B() async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection('student_class')
          .where("name", isEqualTo: "Kelas B")
          .get();
      idB = querySnapshot.docs.first.id;
      final Map data = querySnapshot.docs.first.data() as Map;
      jumlahB = data["student_count"];
    } catch (error) {
      print('Error fetching murid for class A: $error');
    }
  }

  Future<void> fetch_user() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        username.value = userDoc['name'] ?? 'User';
      }
    } catch (error) {
      print('Error fetching user name: $error');
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
