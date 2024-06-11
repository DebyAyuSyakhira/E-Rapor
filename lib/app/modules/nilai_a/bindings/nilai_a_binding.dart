import 'package:get/get.dart';

import '../controllers/nilai_a_controller.dart';

class NilaiABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NilaiAController>(
      () => NilaiAController(),
    );
  }
}
