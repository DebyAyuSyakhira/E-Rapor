import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB5iqzzWblTVmJG3egzw6wsPZN6-xpXfm8",
      appId: "1:303926011262:android:2f3b85c7d2fba1de7abf2f",
      messagingSenderId: "303926011262",
      projectId: "e-rapor-al-ikhlas",
    ),
  );
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      title: "E-Rapor",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
