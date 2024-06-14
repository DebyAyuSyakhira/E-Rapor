import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  void fetch_playgroup() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('student_class').where("name", isEqualTo: "Playgroup").get();
          idPlaygroup = querySnapshot.docs.first.id;
          final Map data = querySnapshot.docs.first.data() as Map;
          jumlahPlaygroup = data["student_count"];
    } catch (error) {
      print('Error fetching murid for class A: $error');
    }
  }

  void fetch_A() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('student_class').where("name", isEqualTo: "Kelas A").get();
          idA = querySnapshot.docs.first.id;
          final Map data = querySnapshot.docs.first.data() as Map;
          jumlahA = data["student_count"];
    } catch (error) {
      print('Error fetching murid for class A: $error');
    }
  }

  void fetch_B() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('student_class').where("name", isEqualTo: "Kelas B").get();
          idB = querySnapshot.docs.first.id;
          final Map data = querySnapshot.docs.first.data() as Map;
          jumlahB = data["student_count"];
    } catch (error) {
      print('Error fetching murid for class A: $error');
    }
  }

  void fetch_user() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        username.value = userDoc['name'] ?? 'User';
      }
    } catch (error) {
      print('Error fetching user name: $error');
    }
  }
}
