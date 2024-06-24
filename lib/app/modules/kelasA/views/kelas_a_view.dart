import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/kelas_a_controller.dart';

class KelasAView extends GetView<KelasAController> {
  const KelasAView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAFTAR MURID KELAS A'), // Judul AppBar
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF00871B), 
      ),
      body: Obx(() {
        // Widget Obx akan rebuild saat nilai dari Rx variable berubah
        final List<DocumentSnapshot> muridList = controller.murid_a;
        print(muridList);
        if (muridList.isEmpty) {
          // Jika daftar murid kosong, tampilkan pesan
          return const Center(
            child: Text('Tidak ada murid'),
          );
        } else {
          // Jika daftar murid tidak kosong, tampilkan ListView dengan daftar murid
          return ListView.builder(
            itemCount: muridList.length,
            itemBuilder: (context, index) {
              final murid = muridList[index].data() as Map<String, dynamic>;
              // Tampilkan informasi murid dalam ListTile
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman baru saat data murid ditekan
                    Get.toNamed("/edit-murid", arguments: muridList[index].id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF00871B), // Ganti warna latar belakang menjadi hijau
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(
                        murid['name'], // Tampilkan nama murid di tengah
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Transform.translate(
                        offset: const Offset(16, 0),
                        child: PopupMenuButton<String>(
                          icon:
                              const Icon(Icons.more_vert, color: Colors.white),
                          itemBuilder: (context) {
                            return <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'kelola-rapor',
                                child: Text('Kelola Rapor'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'lihat-rapor',
                                child: Text('Rapor Semester 1'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'lihat-rapor2',
                                child: Text('Rapor Semester 2'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'hapus',
                                child: Text('Hapus'),
                              ),
                            ];
                          },
                          onSelected: (String value) {
                            // Tambahkan logika untuk setiap opsi di sini
                            if (value == 'kelola-rapor') {
                              // Navigasi ke halaman kelola-rapor saat 'Lihat Rapor' dipilih
                              Get.toNamed(Routes.NILAI_A,
                                  arguments: muridList[index].id);
                            } else if (value == 'lihat-rapor') {
                              // Navigasi ke halaman rapor saat 'Ubah Data' dipilih
                              Get.toNamed(Routes.RAPOR, arguments: {
                                "idMurid": muridList[index].id,
                                'semester': 'Semester 1'
                              });
                            } else if (value == 'lihat-rapor2') {
                              // Navigasi ke halaman rapor saat 'Ubah Data' dipilih
                              Get.toNamed(Routes.RAPOR, arguments: {
                                "idMurid": muridList[index].id,
                                'semester': 'Semester 2'
                              });
                            } else if (value == 'hapus') {
                              // Hapus data saat 'Hapus' dipilih
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Konfirmasi Hapus'),
                                    content: const Text(
                                        'Apakah Anda yakin ingin menghapus data murid ini?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Batalkan penghapusan
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Batal', style: TextStyle(color:Color.fromRGBO(0, 135, 27, 1),)),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          // Lakukan penghapusan
                                          final muridId = muridList[index]
                                              .id; // dapatkan ID murid
                                          await FirebaseFirestore.instance
                                              .collection('student')
                                              .doc(
                                                  muridId) // gunakan ID murid untuk menghapus data
                                              .delete();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Hapus', style: TextStyle(color:Color.fromRGBO(0, 135, 27, 1),)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi saat tombol tambah murid ditekan
          Get.toNamed("/add-murid", arguments: controller.idKelasA);
        },
        backgroundColor: const Color.fromARGB(255, 244, 221, 10),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
