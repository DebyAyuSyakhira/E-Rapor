import 'package:get/get.dart';

import '../controllers/kelola_rapor_controller.dart';

class KelolaRaporBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelolaRaporController>(
      () => KelolaRaporController(),
    );
  }
}
