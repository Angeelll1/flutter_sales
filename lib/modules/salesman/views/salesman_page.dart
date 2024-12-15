import 'package:flutter/material.dart';
import '../../account/views/account.dart';
import 'salesman_button.dart';
import 'salesman_pict_border.dart';
import 'package:get/get.dart';
import '../../../core/widgets/appbar_default.dart';
import '../controllers/salesman_controller.dart';
import '../../../core/widgets/loading.dart';
import 'salesman_dropdown.dart';

class SalesmanPage extends GetView<SalesmanController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.isReadOnly.value
          ? appBarDefault("Hasil Gambar")
          : appBarDefault("Input Gambar"),
      body: Obx(
        () => controller.isLoading.value
            ? defaultLoading()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    SalesmanDropdown(
                      title: "Toko",
                      lsItem: controller.lsSubdist,
                      // index: 0,
                    ),
                    SalesmanDropdown(
                      title: "Chiller",
                      lsItem: controller.lsChiller,
                      // index: 1,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    pictureBox(),
                    controller.isReadOnly.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hasil Deteksi : \n',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${controller.detectionString.value}',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    SalesmanButton(formKey: _formKey)
                  ],
                ),
              ),
      ),
    );
  }
}
