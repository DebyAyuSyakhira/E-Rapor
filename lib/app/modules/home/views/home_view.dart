import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.fetchdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Stack(
            children: [
              // Background image
              SizedBox.expand(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Overlay content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Obx(() => Text(
                                  controller.username.value,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: 'Pemberitahuan',
                              middleText:
                                  'Apakah Anda yakin ingin keluar dari Aplikasi ini?',
                              textConfirm: 'Keluar',
                              textCancel: 'Batal',
                              buttonColor: Colors.transparent,
                              confirmTextColor: const Color.fromRGBO(0, 135, 27, 1),
                              cancelTextColor: const Color.fromRGBO(0, 135, 27, 1),
                              onConfirm: () {
                                controller.logout();
                              },
                              onCancel: () {
                                Get.back();
                              },
                            );
                          },
                          icon: const Icon(Icons.logout_rounded, size: 25),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClassCard(
                          className: 'PLAYGROUP',
                          onPressed: () {
                            Get.toNamed(Routes.PLAYGROUP,
                                arguments: controller.idPlaygroup);
                            // Handle PLAYGROUP button press
                            print('Tombol PLAYGROUP ditekan');
                          },
                          studentCount: controller.jumlahPlaygroup,
                        ),
                        const SizedBox(height: 16.0),
                        ClassCard(
                          className: 'KELAS A',
                          onPressed: () {
                            Get.toNamed(Routes.KELAS_A,
                                arguments: controller.idA);
                            // Handle KELAS A button press
                            print('Tombol KELAS A ditekan');
                          },
                          studentCount: controller.jumlahA,
                        ),
                        const SizedBox(height: 16.0),
                        ClassCard(
                          className: 'KELAS B',
                          onPressed: () {
                            Get.toNamed(Routes.KELAS_B,
                                arguments: controller.idB);
                            // Handle KELAS B button press
                            print('Tombol KELAS B ditekan');
                          },
                          studentCount: controller.jumlahB,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class ClassCard extends StatefulWidget {
  final String className;
  final int studentCount;
  final VoidCallback onPressed;

  ClassCard(
      {required this.className,
      required this.onPressed,
      required this.studentCount});

  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isTapped ? 0.95 : 1.0),
        child: SizedBox(
          width: double.infinity,
          height: 145,
          child: Card(
            color: const Color.fromRGBO(0, 135, 27, 1)
                .withOpacity(0.8), // Button color set to #00871B
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.className,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Jumlah Murid : ${widget.studentCount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
