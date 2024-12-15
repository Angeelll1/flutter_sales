import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

PreferredSizeWidget appBarDefault(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.sourcingRed,
    // leading: IconButton(
    //   tooltip: 'Back to Previous Page',
    //   icon: Icon(Icons.arrow_back),
    //   onPressed: () => Get.back(),
    // ),
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    // automaticallyImplyLeading: false,
    elevation: 0,
  );
}
