import 'package:get/get.dart';

import '../controllers/nilai_playgroup_controller.dart';

class NilaiPlaygroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NilaiPlaygroupController>(
      () => NilaiPlaygroupController(),
    );
  }
}
