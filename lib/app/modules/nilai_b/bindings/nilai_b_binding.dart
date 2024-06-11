import 'package:get/get.dart';

import '../controllers/nilai_b_controller.dart';

class NilaiBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NilaiBController>(
      () => NilaiBController(),
    );
  }
}
