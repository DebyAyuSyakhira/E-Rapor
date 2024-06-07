import 'package:get/get.dart';

import '../controllers/edit_murid_controller.dart';

class EditMuridBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMuridController>(
      () => EditMuridController(),
    );
  }
}
