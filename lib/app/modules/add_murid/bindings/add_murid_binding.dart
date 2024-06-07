import 'package:get/get.dart';

import '../controllers/add_murid_controller.dart';

class AddMuridBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMuridController>(
      () => AddMuridController(),
    );
  }
}
