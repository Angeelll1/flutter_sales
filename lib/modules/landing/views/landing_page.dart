import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/landingpage_controller.dart';

class LandingPage extends GetView<LandingPageController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          body: ListView(
        children: [Text("Landing Page..")],
      )),
    );
  }
}
