import 'package:get/get.dart';

import '../controllers/playgroup_controller.dart';

class PlaygroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaygroupController>(
      () => PlaygroupController(),
    );
  }
}
