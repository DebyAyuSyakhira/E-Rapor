import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/kelas_b_controller.dart';

class KelasBView extends GetView<KelasBController> {
  const KelasBView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAFTAR MURID KELAS B'), // Judul AppBar
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
        backgroundColor: const Color(0xFF00871B), // Warna latar belakang AppBar
      ),
      body: Obx(() {
        // Widget Obx akan rebuild saat nilai dari Rx variable berubah
        final List<DocumentSnapshot> muridList = controller.murid_b.value;
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
                    Get.toNamed("/edit-murid");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(
                          0xFF00871B), // Ganti warna latar belakang menjadi hijau
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(
                        murid['nama'], // Tampilkan nama murid di tengah
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: PopupMenuButton<String>(
                        itemBuilder: (context) {
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              child: Text('Kelola Rapor'),
                              value: 'kelola-rapor',
                            ),
                            PopupMenuItem<String>(
                              child: Text('Lihat Rapor'),
                              value: 'lihat-rapor',
                            ),
                            PopupMenuItem<String>(
                              child: Text('Hapus'),
                              value: 'hapus',
                            ),
                          ];
                        },
                        onSelected: (String value) {
                          // Tambahkan logika untuk setiap opsi di sini
                          if (value == 'kelola-rapor') {
                            // Navigasi ke halaman kelola-rapor saat 'Lihat Rapor' dipilih
                            Get.toNamed("/nilai-b");
                          } else if (value == 'lihat-rapor') {
                            // Navigasi ke halaman rapor saat 'Ubah Data' dipilih
                            Get.toNamed("/rapor");
                          } else if (value == 'hapus') {
                            // Hapus data saat 'Hapus' dipilih
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Konfirmasi Hapus'),
                                  content: Text(
                                      'Apakah Anda yakin ingin menghapus data murid ini?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Batalkan penghapusan
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        // Lakukan penghapusan
                                        await FirebaseFirestore.instance
                                            .collection('murid_b')
                                            .doc(muridList[index].id)
                                            .delete();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Hapus'),
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
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi saat tombol tambah murid ditekan
          Get.toNamed("/add-murid");
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
