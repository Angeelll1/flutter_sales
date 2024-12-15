import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/appbar_default.dart';
import '../../../core/widgets/loading.dart';
import '../controllers/pic_controller.dart';
import 'pic_container.dart';
import 'pic_drawer.dart';

class PicListView extends GetView<PicController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault('Report'),
      body: Obx(
        () => controller.isLoading.value
            ? defaultLoading()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  listViewData(),
                ],
              ),
      ),
      endDrawer: PicDrawer(),
    );
  }

  Widget listViewData() {
    return Expanded(
      child: controller.lsHistory.isEmpty
          ? Center(
              child: Text(
                "No History",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              itemCount: controller.lsHistory.length,
              itemBuilder: (BuildContext context, int index) {
                return BrowseContainer(index: index);
              },
            ),
    );
  }
}
