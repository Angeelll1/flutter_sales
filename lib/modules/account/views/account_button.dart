import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/manager/session.dart';
import '../../../navigation/pages.dart';
import '../controllers/account_controller.dart';

class AccountPageButton extends GetView<AccountController> {
  const AccountPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.0,
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 22.0,
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sourcingRed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: () => {Session.invalidate(), Get.offAllNamed(Routes.login)},
        icon: Text('Sign Out',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
        label: Icon(
          Icons.exit_to_app_outlined,
          color: AppColors.justWhite,
          size: (20.0),
        ),
      ),
    );
  }
}
