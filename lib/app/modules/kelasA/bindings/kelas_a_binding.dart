import 'package:get/get.dart';

import '../controllers/kelas_a_controller.dart';

class KelasABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelasAController>(
      () => KelasAController(),
    );
  }
}
