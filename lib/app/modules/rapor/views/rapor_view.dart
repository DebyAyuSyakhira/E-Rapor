import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/rapor_controller.dart';

class RaporView extends GetView<RaporController> {
  const RaporView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 135, 27, 1),
        title: const Text(
          'Rapor',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              // To Do : Ubah menuju ke tampilan Home kelas masing - masing
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.fetchMuridDanRapor(),
        builder: (context, snapshot) {
          return ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'LAPORAN PERKEMBANGAN ANAK',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // color: Colors.red,
                // width: double.infinity,
                margin: const EdgeInsets.only(
                  left: 10,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      horizontalMargin: 0,
                      dataRowHeight: 30,
                      headingTextStyle: const TextStyle(fontSize: 16),
                      // border: TableBorder.all(),
                      dividerThickness: 0.1,
                      columnSpacing: 0.1,
                      columns: const [
                        DataColumn(
                          label: Flexible(child: Text('')),
                        ),
                        DataColumn(
                          label: Flexible(child: Text('')),
                        ),
                        DataColumn(
                          label: Flexible(child: Text('')),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text(
                            'Nama',overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )),
                          const DataCell(Text(' : ',overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataMurid["name"]}',overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Nomor Induk',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          const DataCell(Text(' : ',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataMurid["id_number"]}',maxLines: 3,
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Usia',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          const DataCell(Text(' : ',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataMurid["age"]}',
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Semester',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          const DataCell(Text(' : ',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataRapor["semester"]}',
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Berat badan',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          const DataCell(Text(' : ',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataRapor["body_weight"]}',
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Tinggi Badan',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          const DataCell(Text(' : ',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataRapor["body_height"]}',
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Izin',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          const DataCell(Text(' : ',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataRapor["number_of_permit_days"]}',
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Sakit',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          const DataCell(Text(' : ',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataRapor["number_of_sick_days"]}',
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Tanpa Ket',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          const DataCell(Text(' : ',
                              style: TextStyle(fontSize: 16, color: Colors.black))),
                          DataCell(Text('${controller.dataRapor["number_of_days_without_information"]}',
                              style: const TextStyle(fontSize: 16, color: Colors.black))),
                        ])
                      ]),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "Perkembangan Nilai Agama dan Moral",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "${controller.dataRapor["religious_and_moral_values_development"]}",
                          style: const TextStyle(fontSize: 15, height: 1.5),
                          maxLines: 10,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "Perkembangan Motorik",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "${controller.dataRapor["physical_development"]}",
                          style: const TextStyle(fontSize: 15, height: 1.5),
                          maxLines: 10,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "Perkembangan Kognitif",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "${controller.dataRapor["cognitive_development"]}",
                          style: const TextStyle(fontSize: 15, height: 1.5),
                          maxLines: 10,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "Perkembangan Sosial Emosional",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "${controller.dataRapor["social_emotional_development"]}",
                          style: const TextStyle(fontSize: 15, height: 1.5),
                          maxLines: 10,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "Perkembangan Bahasa",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "${controller.dataRapor["language_development"]}",
                          style: const TextStyle(fontSize: 15, height: 1.5),
                          maxLines: 10,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "Perkembangan Seni",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "${controller.dataRapor["artistic_development"]}",
                          style: const TextStyle(fontSize: 15, height: 1.5),
                          maxLines: 10,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 15,
              )
            ],
          );
        }
      ),
    );
  }
}
