import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/screen_configuration.dart';
import 'salesman_page.dart';

extension SalesmanPicture on SalesmanPage {
  Widget pictureBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          width: ScreenConfiguration.screenHeight * 0.4,
          height: ScreenConfiguration.screenHeight * 0.4,
          child: Obx(
            () => controller.txtPath.value.text == ""
                ? GestureDetector(
                    onTap: () {
                      controller.pickPhoto();
                    },
                    child: Icon(
                      Icons.add_a_photo,
                      color: AppColors.sourcingRed,
                      size: 40,
                    ),
                  )
                : displayImage(controller.txtPath.value.text),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.deleteImage();
          },
          child: Obx(() =>
              controller.txtPath.value.text == "" || controller.isReadOnly.value
                  ? Container()
                  : Row(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Icon(
                          Icons.clear,
                          color: AppColors.sourcingRed,
                        ),
                      ],
                    )),
        ),
      ],
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
}
