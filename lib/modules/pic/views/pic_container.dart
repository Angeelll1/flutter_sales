import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pic_controller.dart';
import 'pic_container_data.dart';

class BrowseContainer extends GetView<PicController> {
  const BrowseContainer({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        //   () =>
        Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    controller.onTap(index);
                  },
                  child: BrowseFieldData(index: index)),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
