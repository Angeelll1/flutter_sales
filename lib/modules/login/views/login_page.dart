import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/screen_configuration.dart';
import '../controllers/loginpage_controller.dart';
import 'login_page_logo.dart';
import 'login_page_button.dart';
import 'login_page_form.dart';

class LoginPage extends GetView<LoginPageController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenConfiguration().init(context);
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              height: ScreenConfiguration.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo(),
                  appName(context),
                  SizedBox(height: 10),
                  LoginPageForm(formKey: _formKey),
                  SizedBox(height: 10),
                  LoginPageButton(formKey: _formKey),
                  SizedBox(height: 10),
                  copyRight()
                ],
              ),
            ),
          )),
    );
  }
}
