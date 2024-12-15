import 'package:get/get.dart';

import '../controllers/pic_result_controller.dart';


class PicResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PicResultController>(() => PicResultController(Get.arguments));
  }
}
