import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../controllers/loginpage_controller.dart';


class LoginPageForm extends GetView<LoginPageController> {
  const LoginPageForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            usernameField(),
            SizedBox(height: 10),
            passwordField(),
          ],
        ),
      ),
    );
  }

  SizedBox passwordField() {
    return SizedBox(
      // width: Get.width * 0.85,
      child: Obx(() => TextFormField(
            validator: (value) =>
                value!.trim().isEmpty ? 'Password Required' : null,
            controller: controller.passwordController,
            textInputAction: TextInputAction.done,
            obscureText: controller.isHidePassword.value,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppColors.sourcingRed,
                ),
                labelText: 'Password',
                contentPadding: EdgeInsets.only(left: 5, right: 5),
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.togglePassVisibility();
                  },
                  child: Icon(
                    controller.isHidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: controller.isHidePassword.value
                        ? Colors.grey
                        : AppColors.sourcingRed,
                  ),
                )),
          )),
    );
  }

  SizedBox usernameField() {
    return SizedBox(
      child: TextFormField(
        validator: (value) =>
            value!.trim().isEmpty ? 'Username Required' : null,
        controller: controller.usernameController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Username',
          prefixIcon: Icon(
            Icons.person,
            color: AppColors.sourcingRed,
          ),
          contentPadding: EdgeInsets.only(left: 5, right: 5),
          fillColor: Colors.grey,
        ),
      ),
    );
  }
}
