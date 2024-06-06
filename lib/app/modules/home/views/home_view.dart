import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  List<String> listCountry = ['Semester 1', 'Semester 2'];
  String? _selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.contain,
              alignment: Alignment.bottomLeft)),
      child: SizedBox(
          width: double.infinity,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Kelola Rapor Murid",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(0, 135, 27, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Nama : (nama murid)",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Nomor Induk : (nomor induk murid)",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Usia : (usia murid)",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Semester",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 135, 27, 1), width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 135, 27, 1), width: 3),
                      ),
                    ),
                    hint: const Text(
                      "Pilih Semester Murid",
                      style: TextStyle(color: Colors.red),
                    ),
                    items: listCountry.map(
                      (String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Color.fromRGBO(0, 135, 27, 1),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    value: _selectedCountry,
                    onChanged: (String? value) {
                      // setState di bawah blm ada methodnya
                      // setState
                      (() {
                        _selectedCountry = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Perkembangan Nilai Agama dan Moral",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            minLines: 5,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                hintText: "Deskripsi",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Perkembangan Motorik",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            minLines: 5,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                hintText: "Deskripsi",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Perkembangan Kognitif",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            minLines: 5,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                hintText: "Deskripsi",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Perkembangan Sosial dan Emosional",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            minLines: 5,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                hintText: "Deskripsi",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Perkembangan Bahasa",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            minLines: 5,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                hintText: "Deskripsi",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Perkembangan Seni",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                            minLines: 5,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                hintText: "Deskripsi",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Pertumbuhan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                            maxLines: 1,
                            decoration: const InputDecoration(
                                hintText: "Berat Badan (Kg)",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            maxLines: 1,
                            decoration: const InputDecoration(
                                hintText: "Tinggi Badan (Cm)",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Keterangan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                            maxLines: 1,
                            decoration: const InputDecoration(
                                hintText: "Izin",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            maxLines: 1,
                            decoration: const InputDecoration(
                                hintText: "Sakit",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)))),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            maxLines: 1,
                            decoration: const InputDecoration(
                                hintText: "Tanpa Keterangan",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 135, 27, 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 1),
                                        width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 135, 27, 100),
                                        width: 3)))),
                        const SizedBox(
                          height: 35,
                        ),
                        SizedBox(
                          height: 70,
                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(0, 135, 27, 1)),
                            onPressed: (){Get.toNamed(Routes.RAPOR);}, child: const Text("Simpan",style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
