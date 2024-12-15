import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/manager/session.dart';
import '../../../core/model/m_user.dart';
import '../../../core/services/api_token.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../navigation/pages.dart';

class LoginPageController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var currentYear = "".obs;

  var isLoading = true.obs;
  var isHidePassword = true.obs;

  MUser? mUser;

  @override
  void onInit() async {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);

    currentYear.value = dateParse.year.toString();

    isLoading(false);

    super.onInit();
  }

  togglePassVisibility() {
    isHidePassword.value = !isHidePassword.value;
  }

  onLogin() async {
    isLoading(true);

    BuildContext context = Get.context!;

    FocusScope.of(context).requestFocus(new FocusNode());

    //get token
    var resultToken = await getToken(body: {
      'username': usernameController.text,
      'password': passwordController.text
    });

    if (resultToken == 'Offline') {
      Get.back();

      CSnackBar.showError(
          message: "Server Offline. Please check periodically.");
    } else {
      if (resultToken.contains('Incorrect') ||
          resultToken.contains('Connection') ||
          resultToken.contains('Error')) {
        CSnackBar.showError(message: "$resultToken");
      } else {
        //set token
        await Session.set(SessionCode.token, resultToken);

        print(resultToken);

        mUser = MUser.fromJson(await Session.getObject(SessionCode.mUser));

        //pindah page
        mUser!.user_type == "admin"
            ? Get.offNamed(Routes.pic)
            : Get.offNamed(Routes.sales);
      }
    }

    isLoading(false);
  }
}
