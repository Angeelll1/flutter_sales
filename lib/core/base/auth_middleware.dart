import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_service.dart';

class AuthMiddleware extends GetMiddleware {
  final mainService = Get.find<MainService>();

  @override
  GetPage? onPageCalled(GetPage? page) {
    print("AuthMiddleware :: onPageCalled");

    return super.onPageCalled(page);
  }

  @override
  RouteSettings? redirect(String? route) {
    return super.redirect(route);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    print("AuthMiddleware :: onBindingsStart");
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    print("AuthMiddleware :: onPageBuildStart");
    return super.onPageBuildStart(page);
  }

  @override
  Widget onPageBuilt(Widget page) {
    print("AuthMiddleware :: onPageBuilt");
    return page;
  }

  @override
  void onPageDispose() {
    print("AuthMiddleware :: onPageDispose");
  }
}
