import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/widgets/appbar_default.dart';
import '../controllers/pic_result_controller.dart';
import 'pic_result_photo.dart';

class PicResultPage extends GetView<PicResultController> {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: appBarDefault('History'),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            setTitleAndData('Docno', controller.result.docno),
            setTitleAndData('Toko', controller.result.subdist_name),
            setTitleAndData('Chiller', controller.result.chiller_id),
            setTitleAndData('Date', controller.result.send_date),
            SizedBox(height: 12),
            Expanded(child: PicResultPhoto()),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hasil Deteksi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: controller.detectionData.entries.map<Widget>((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 5),
                    child: Text('${entry.key} : ${entry.value}',
                        style: TextStyle(fontSize: 16)),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
