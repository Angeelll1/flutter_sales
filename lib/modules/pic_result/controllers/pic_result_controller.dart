import 'dart:convert';

import 'package:get/get.dart';
import '../../../core/widgets/preview_photo.dart';

class PicResultController extends GetxController {
  Map arguments;
  var dataMulti;

  var result;

  var isLoading = false.obs;

  var detectionData;

  PicResultController(this.arguments) : result = arguments["result"] ?? "";

  @override
  void onInit() {
    print(result.path_image);
    super.onInit();

    var resultDetection = result.detections;

    detectionData = jsonDecode(resultDetection);
  }

  void toPreviewPhoto(String path) {
    // String path_file = URL.FLASK + path;

    // print('path = $path_file');
    Get.to(() => PreviewPhoto(tag: "Preview Image", path: path));
  }
}
