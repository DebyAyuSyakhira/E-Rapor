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
      body: ListView(
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
                  rows: const [
                    DataRow(cells: [
                      DataCell(Flexible(
                        child: Text(
                          'Nama',overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      )),
                      DataCell(Flexible(
                        child: Text(' : ',overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16, color: Colors.black)),
                      )),
                      DataCell(Flexible(
                        child: Text('(nama)',overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16, color: Colors.black)),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Flexible(
                        
                        child: Text('Nomor Induk',
                            style: TextStyle(fontSize: 16, color: Colors.black)),
                      )),
                      DataCell(Flexible(
                        child: Text(' : ',
                            style: TextStyle(fontSize: 16, color: Colors.black)),
                      )),
                      DataCell(Flexible(
                        child: Text('(nomor induk)',maxLines: 3,
                            style: TextStyle(fontSize: 16, color: Colors.black)),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Usia',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text(' : ',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text('(usia)',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Semester',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text(' : ',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text('(semester)',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Berat badan',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text(' : ',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text('(berat badan kg)',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Tinggi Badan',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text(' : ',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text('(tinggi badan cm)',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Izin',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text(' : ',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text('(izin hari)',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Sakit',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text(' : ',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text('(sakit hari)',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Tanpa Ket',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text(' : ',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                      DataCell(Text('(tanpa ket hari)',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
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
                    child: const Text(
                      "Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text ",
                      style: TextStyle(fontSize: 15, height: 1.5),
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
                    child: const Text(
                      "Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text ",
                      style: TextStyle(fontSize: 15, height: 1.5),
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
                    child: const Text(
                      "Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text ",
                      style: TextStyle(fontSize: 15, height: 1.5),
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
                    child: const Text(
                      "Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text ",
                      style: TextStyle(fontSize: 15, height: 1.5),
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
                    child: const Text(
                      "Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text ",
                      style: TextStyle(fontSize: 15, height: 1.5),
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
                    child: const Text(
                      "Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text Dummy Text ",
                      style: TextStyle(fontSize: 15, height: 1.5),
                      maxLines: 10,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
