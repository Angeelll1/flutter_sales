import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../controllers/account_controller.dart';

class AccountProfile extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300.withOpacity(0.12),
              blurRadius: 14.0,
              spreadRadius: 5.0,
              offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: TextStyle(
              color: AppColors.textBlack,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            color: Colors.grey.shade200,
            thickness: 0.8,
            indent: 0.0,
            endIndent: 0.0,
          ),
          listIconData(
              Icons.person, '${controller.mUser?.username}'.toUpperCase()),
          listIconData(
              Icons.work, '${controller.mUser?.user_type}'.toUpperCase()),
          listIconData(Icons.corporate_fare_rounded, 'PT MAYORA INDAH Tbk.'),
        ],
      ),
    );
  }

  Widget listIconData(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18.0,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: AppColors.textBlack),
            ),
          )
        ],
      ),
    );
  }
}
