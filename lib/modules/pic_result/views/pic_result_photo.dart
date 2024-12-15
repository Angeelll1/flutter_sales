import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/screen_configuration.dart';
import '../controllers/pic_result_controller.dart';

class PicResultPhoto extends GetView<PicResultController> {
  Widget pictureBox() {
    return Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        width: ScreenConfiguration.screenHeight * 0.4,
        height: ScreenConfiguration.screenHeight * 0.4,
        child: displayImage(controller.result.path_image),
      ),
    );
  }

  Widget displayImage(String path) {
    return GestureDetector(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
            width: ScreenConfiguration.screenHeight * 0.4,
            height: ScreenConfiguration.screenHeight * 0.4,
            child: path.startsWith("http://") || path.startsWith("https://")
                ? CachedNetworkImage(
                    imageUrl: path,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Image.file(File(path), fit: BoxFit.cover)),
      ),
      onTap: () {
        controller.toPreviewPhoto(path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return pictureBox();
  }
}
