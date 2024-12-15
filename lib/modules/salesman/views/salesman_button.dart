import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/screen_configuration.dart';
import '../controllers/salesman_controller.dart';

class SalesmanButton extends GetView<SalesmanController> {
  const SalesmanButton({Key? key, required GlobalKey<FormState> formKey})
      : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenConfiguration.screenHeight * 0.065,
      width: ScreenConfiguration.screenWidth * 0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sourcingRed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () {
          // if (_formKey.currentState!.validate()) {
          // }
          controller.isReadOnly.value
              ? controller.deleteImage()
              : controller.onSubmit();
        },
        child: Obx(
          () => controller.isLoading.value
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : controller.isReadOnly.value
                  ? Text('RE-SUBMIT', style: TextStyle(color: Colors.white))
                  : Text('SUBMIT', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
