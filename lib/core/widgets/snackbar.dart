import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CSnackBar {
CSnackBar.showError(
      {String title = "Oops, terjadi kesalahan.. :(",
      required String message,
      IconData icon = Icons.warning_amber,
      Color iconColor = Colors.white,
      String buttonText = "Ok",
      Duration? duration,
      autoClose = true,
      VoidCallback? buttonAction}) {
    if (duration == null) {
      duration = Duration(seconds: 1);
    }
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: autoClose ? duration : null,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        mainButton: TextButton(
          child: Text(buttonText),
          onPressed: buttonAction ?? () => Get.closeCurrentSnackbar(),
        ),
      ),
    );
  }
}