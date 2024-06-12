import 'package:e_rapor/app/modules/playgroup/controllers/playgroup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaygroupView extends GetView<PlaygroupController> {
  const PlaygroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAFTAR MURID PLAYGROUP'), // Judul AppBar
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
        backgroundColor: const Color(0xFF00871B), // Warna latar belakang AppBar
      ),
      body: Obx(() {
        // Widget Obx akan rebuild saat nilai dari Rx variable berubah
        final List<DocumentSnapshot> muridList = controller.murid_c;
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
                      trailing: PopupMenuButton<String>(
                        itemBuilder: (context) {
                          return <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              child: Text('Kelola Rapor'),
                              value: 'kelola-rapor',
                            ),
                            const PopupMenuItem<String>(
                              child: Text('Lihat Rapor'),
                              value: 'lihat-rapor',
                            ),
                            const PopupMenuItem<String>(
                              child: Text('Hapus'),
                              value: 'hapus',
                            ),
                          ];
                        },
                        onSelected: (String value) {
                          // Tambahkan logika untuk setiap opsi di sini
                          if (value == 'kelola-rapor') {
                            // Navigasi ke halaman kelola-rapor saat 'Lihat Rapor' dipilih
                            Get.toNamed("/nilai-playgroup");
                          } else if (value == 'lihat-rapor') {
                            // Navigasi ke halaman rapor saat 'Ubah Data' dipilih
                            Get.toNamed("/rapor");
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
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        // Lakukan penghapusan
                                        await FirebaseFirestore.instance;
                                        final muridId = muridList[index]
                                            .id; // dapatkan ID murid
                                        await FirebaseFirestore.instance
                                            .collection('student')
                                            .doc(
                                                muridId) // gunakan ID murid untuk menghapus data
                                            .delete();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Hapus'),
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
          Get.toNamed("/add-murid", arguments: controller.idPlaygroup);
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
