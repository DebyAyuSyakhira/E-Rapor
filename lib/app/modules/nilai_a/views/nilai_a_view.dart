import 'package:e_rapor/app/modules/nilai_a/controllers/nilai_a_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class NilaiAView extends GetView<NilaiAController> {
  NilaiAView({super.key});
  List<String> listsemester = ['Semester 1', 'Semester 2'];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchMurid(),
      builder: (context, snapshot) {
        
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
                            child: Text(
                              "nama: ${controller.data['name']}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Nomor Induk : ${controller.data['id_number']}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Usia : ${controller.data['age']}",
                              style: const TextStyle(
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                                  controller.fetchMurid();
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
                                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Perkembangan Motorik",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Perkembangan Kognitif",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Perkembangan Sosial Emosional",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Perkembangan Bahasa",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Perkembangan Seni",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Pertumbuhan",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[\d,]')),
                                  ],
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
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
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[\d,]')),
                                  ],
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Jumlah Ketidakhadiran",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                            width: 3))),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 70,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.addData(
                                        controller.agamaController.text,
                                        controller.motorikController.text,
                                        controller.kognitifController.text,
                                        controller.sosialController.text,
                                        controller.bahasaController.text,
                                        controller.seniController.text,
                                        controller.beratBadanController.text,
                                        controller.tinggiBadanController.text,
                                        controller.izinController.text,
                                        controller.sakitController.text,
                                        controller.tanpaKeteranganController.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(0, 135, 27, 1)),
                                  child: const Text(
                                    "Simpan",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ))
                        ])))));
      }
    );
  }
}
