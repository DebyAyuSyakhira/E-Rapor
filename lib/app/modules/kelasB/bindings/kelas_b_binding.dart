import 'package:get/get.dart';

import '../controllers/kelas_b_controller.dart';

class KelasBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelasBController>(
      () => KelasBController(),
    );
  }
}
