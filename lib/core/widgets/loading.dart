import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

defaultLoading() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 10),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.sourcingRed),
        strokeWidth: 3,
      ),
    ),
  );
}
