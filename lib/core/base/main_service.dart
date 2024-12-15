import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/app_colors.dart';
import '../constants/screen_configuration.dart';

class MainService extends GetxService {
  Future<MainService> init() async => this;

  var _theme = "";
  var _appName = "";
  var _currentVersion = "";
  var _currentVersionName = "";

  String get appName {
    return _appName;
  }

  String get currentVersion {
    return _currentVersion;
  }

  String get currentVersionName {
    return _currentVersionName;
  }

  @override
  void onInit() async {
    print("MainService :: onInit()");

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _appName = packageInfo.appName;
    _currentVersion = packageInfo.version;
    _currentVersionName = "${packageInfo.version}+${packageInfo.buildNumber}";

    Get.changeTheme(theme(theme: _theme));

    super.onInit();
  }

  @override
  void onReady() {
    ScreenConfiguration().init(Get.context!);

    super.onReady();
  }

  Map<String, Color> themePalette() {
    return AppColors.defaultPalette;
  }

  ThemeData theme({String theme = ""}) {
    Map<String, Color> palette =
         AppColors.defaultPalette;

    return ThemeData(
      useMaterial3: false,
      appBarTheme: AppBarTheme(backgroundColor: palette["darkSeed"]!),
      colorScheme: ColorScheme.fromSeed(
        seedColor: palette["seed"]!,
      ),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: palette["cursor"],
          selectionColor: palette["selection"],
          selectionHandleColor: palette["selectionHandle"]),
      tabBarTheme: TabBarTheme(
          labelStyle:
              TextStyle(color: palette["text"], fontWeight: FontWeight.w500),
          unselectedLabelColor: palette["textUnselected"],
          indicatorColor: palette["textIndicator"]),
    );
  }
}
