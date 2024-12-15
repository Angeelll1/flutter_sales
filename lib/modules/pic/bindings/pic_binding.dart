import 'package:get/get.dart';

import '../controllers/pic_controller.dart';


class PicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PicController>(() => PicController());
  }
}
