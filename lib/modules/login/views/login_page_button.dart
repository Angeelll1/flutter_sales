import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/screen_configuration.dart';
import '../controllers/loginpage_controller.dart';

class LoginPageButton extends GetView<LoginPageController> {
  const LoginPageButton({Key? key, required GlobalKey<FormState> formKey})
      : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenConfiguration.screenHeight * 0.07,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sourcingRed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.onLogin();
          }
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
              : Text('SIGN IN', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
