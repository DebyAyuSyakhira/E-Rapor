import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/kelola_rapor_controller.dart';

class KelolaRaporView extends GetView<KelolaRaporController> {
  KelolaRaporView({super.key});
  List<String> listsemester = ['Semester 1', 'Semester 2'];

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
                    child: Column(children: [
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Obx(() => DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(0, 135, 27, 1),
                                    width: 3),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(0, 135, 27, 1),
                                    width: 3),
                              ),
                            ),
                            hint: const Text(
                              "Pilih Semester Murid",
                              style: TextStyle(color: Colors.red),
                            ),
                            items: listsemester.map(
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
                            value: controller.selectedSemester.value.isEmpty
                                ? null
                                : controller.selectedSemester.value,
                            onChanged: (String? value) {
                              controller.selectedSemester.value = value!;
                            },
                          )),
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
                              controller: controller.agamaController,
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
                              "Perkembangan Motorik",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.motorikController,
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
                              "Perkembangan Kognitif",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.kognitifController,
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
                              "Perkembangan Sosial Emosional",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.sosialController,
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
                              "Perkembangan Bahasa",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.bahasaController,
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
                              "Perkembangan Seni",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.seniController,
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
                              "Tinggi Badan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.tinggiBadanController,
                              decoration: const InputDecoration(
                                  hintText: "Tinggi Badan",
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
                              "Berat Badan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.beratBadanController,
                              decoration: const InputDecoration(
                                  hintText: "Berat Badan",
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
                              "Jumlah Ketidakhadiran",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Izin",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.izinController,
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
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Sakit",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.sakitController,
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
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Tanpa Keterangan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.tanpaKeteranganController,
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
                                          color: Color.fromRGBO(0, 135, 27, 1),
                                          width: 3)))),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {controller.addData(
                                  controller.agamaController.text, controller.motorikController.text,
                                controller.kognitifController.text, controller.sosialController.text, controller.bahasaController.text, controller.seniController.text,
                                controller.beratBadanController.text, controller.tinggiBadanController.text, controller.izinController.text, controller.sakitController.text,
                                controller.tanpaKeteranganController.text);
                              },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(0, 135, 27, 1)),
                            child: const Text(
                              "Simpan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))
                    ])))));
  }
}
