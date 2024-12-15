import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/appbar_default.dart';
import '../../../core/widgets/loading.dart';
import '../controllers/account_controller.dart';
import 'account_button.dart';
import 'account_profile.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AccountController>(() => AccountController());

    return Scaffold(
      appBar: appBarDefault('My Account'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: Obx(
          () => controller.isLoading.value
              ? defaultLoading()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.mUser?.name}'.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.textBlack,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontFeatures: const [FontFeature.proportionalFigures()],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AccountProfile()
                  ],
                ),
        ),
      ),
      bottomNavigationBar: AccountPageButton(),
    );
  }
}
