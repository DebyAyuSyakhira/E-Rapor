import 'package:e_rapor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
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
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() => Text(
                          controller.username.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        Get.offAllNamed(Routes.LOGIN);
                        // Handle logout button press
                        print('Tombol Keluar ditekan');
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClassCard(
                        className: 'PLAYGROUP',
                        onPressed: () {
                          Get.toNamed("/playgroup", arguments: controller.idPlaygroup);
                          // Handle PLAYGROUP button press
                          print('Tombol PLAYGROUP ditekan');
                        }, studentCount: controller.jumlahPlaygroup,
                      ),
                      const SizedBox(height: 16.0),
                      ClassCard(
                        className: 'KELAS A',
                        onPressed: () {
                          Get.toNamed("/kelas-a", arguments: controller.idA);
                          // Handle KELAS A button press
                          print('Tombol KELAS A ditekan');
                        }, studentCount: controller.jumlahA,
                      ),
                      const SizedBox(height: 16.0),
                      ClassCard(
                        className: 'KELAS B',
                        onPressed: () {
                          Get.toNamed("/kelas-b", arguments: controller.idB);
                          // Handle KELAS B button press
                          print('Tombol KELAS B ditekan');
                        }, studentCount: controller.jumlahB,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}

class ClassCard extends StatefulWidget {
  final String className;
  final int studentCount;
  final VoidCallback onPressed;

  ClassCard({required this.className, required this.onPressed, required this.studentCount});

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
          width: 327,
          height: 148.93,
          child: Card(
            color: const Color(0xFF00871B)
                .withOpacity(0.8), // Button color set to #00871B
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.className,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Jumlah Murid : ${widget.studentCount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
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
