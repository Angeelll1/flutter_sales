import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/base/main_service.dart';
import 'core/manager/session.dart';
import 'core/services/api_token.dart';
import 'navigation/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String token = await Session.get(SessionCode.token);
  String resultActive = await checkActiveSession(token);

  String appName = "";
  String toRoute = await AppPages.initPage(resultActive);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await Get.putAsync(() => MainService().init());

    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: appName,
      initialRoute: toRoute,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
    ));
  });
}
