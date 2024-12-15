import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/screen_configuration.dart';
import 'login_page.dart';

extension LoginPageLogo on LoginPage {
  Widget logo() {
    return Container(
      height: ScreenConfiguration.screenHeight * 0.35,
      alignment: Alignment.center,
      child: SizedBox(
        height: ScreenConfiguration.screenHeight * 0.3,
        child: Image(
          image: AssetImage('assets/mayora.png'),
          height: ScreenConfiguration.screenHeight,
        ),
      ),
    );
  }

  Widget appName(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome To",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: Colors.grey),
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            Text(
              "  Mayora Salesman App  ",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: Colors.grey),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget copyRight() {
    return Obx(() => Text(
          'Copyright © Mayora ' + controller.currentYear.value,
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ));
  }
}
