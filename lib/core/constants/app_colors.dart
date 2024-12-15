import 'package:flutter/material.dart';

class AppColors {
  static var goldAmber = Color.fromRGBO(224, 194, 124, 1);
  static var softGold = Color.fromRGBO(211, 206, 177, 1);
  static var sourcingRed = Color.fromRGBO(210, 0, 1, 1);
  static var darkSourcingRed = Color.fromARGB(255, 174, 0, 0);
  static var pastel = Color.fromRGBO(247, 246, 244, 1);
  static var panelRed = Color.fromRGBO(210, 0, 1, 1);
  static var panelPurple = Color.fromRGBO(106, 90, 205, 1);

  static var blue = Color.fromRGBO(26, 139, 181, 1);
  static var darblue = Color.fromRGBO(12, 109, 169, 1);

  static var purple = Color.fromRGBO(116, 88, 206, 1);
  static var darkPurple = Color.fromRGBO(130, 106, 205, 1);

  static var gold = Color(0xffFFB200);
  static var darkGold = Color.fromRGBO(249, 210, 118, 1);

  static var textBlack = Color.fromRGBO(64, 64, 64, 1);
  static var backgroundWhite = Color.fromRGBO(250, 249, 246, 1);
  static Color justWhite = const Color.fromRGBO(245, 254, 253, 1);
  
  static Map<String, Color> defaultPalette = {
    "seed": AppColors.sourcingRed,
    "darkSeed": AppColors.darkSourcingRed,
    "cursor": AppColors.sourcingRed,
    "selection": AppColors.sourcingRed,
    "selectionHandle": AppColors.darkSourcingRed,
    "text": Colors.white,
    "textUnselected": Colors.white70,
    "textIndicator": Colors.white
  };
}
