import 'package:get/get.dart';

import '../controllers/salesman_controller.dart';


class SalesmanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesmanController>(() => SalesmanController());
  }
}
