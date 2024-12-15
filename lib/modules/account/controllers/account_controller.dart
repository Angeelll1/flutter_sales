import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

import '../../../core/manager/session.dart';
import '../../../core/model/m_user.dart';
// import '../../../navigation/pages.dart';

class AccountController extends GetxController {
  MUser? mUser;

  var isLoading = false.obs;

  @override
  void onInit() async {
    isLoading(true);
    print(isLoading.value);
    mUser = MUser.fromJson(await Session.getObject(SessionCode.mUser));

    isLoading(false);

    super.onInit();
  }

  // signOut() {
  //   Session.invalidate();

  //   Get.offAllNamed(Routes.login);
  // }
}
