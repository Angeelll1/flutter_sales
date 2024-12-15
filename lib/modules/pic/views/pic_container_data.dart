import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pic_controller.dart';

class BrowseFieldData extends GetView<PicController> {
  const BrowseFieldData({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        //   () =>
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        setTitleAndData("Docno", controller.lsHistory[index].docno!),
        setTitleAndData("Date", controller.lsHistory[index].send_date!),
        setTitleAndData("Subdist",
            '${controller.lsHistory[index].subdist_id!} - ${controller.lsHistory[index].subdist_name!}'),
      ],
      // ),
    );
  }

  Widget setTitleAndData(String title, String data) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: constraints.maxWidth * 0.25,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  ':  ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Text(
                    data == "" ? "-" : data,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
