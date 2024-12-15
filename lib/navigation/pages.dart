import 'package:get/get.dart';

import '../core/base/auth_middleware.dart';
import '../core/manager/session.dart';
import '../core/model/m_user.dart';
import '../modules/account/bindings/account_bindings.dart';
import '../modules/account/views/account.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_page.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_page.dart';
import '../modules/pic/bindings/pic_binding.dart';
import '../modules/pic/views/pic.dart';
import '../modules/pic_result/bindings/pic_result_binding.dart';
import '../modules/pic_result/views/pic_result.dart';
import '../modules/salesman/bindings/salesman_binidng.dart';
import '../modules/salesman/views/salesman.dart';

part 'routes.dart';

class AppPages {
  AppPages._();

  static Future<String> initPage(resultActive) async {
    MUser? mUser = (await Session.getObject(SessionCode.mUser) != null)
        ? MUser.fromJson(await Session.getObject(SessionCode.mUser))
        : null;

    // return Routes.pic;
    if (resultActive == "Active" && mUser != null) {
      return mUser.user_type == 'admin' ? Routes.pic : Routes.sales;
    } else {
      return Routes.login;
    }
  }

  static String openLandingPage() {
    return Routes.login;
  }

  static final routes = [
    GetPage(
        name: Routes.landing,
        page: () => LandingPage(),
        binding: LandingPageBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        binding: LoginPageBinding()),
    // GetPage(
    //     name: Routes.sales,
    //     page: () => SalesmanPage(),
    //     binding: SalesmanBinding()),
    GetPage(name: Routes.pic, page: () => PicPage(), binding: PicBinding()),
    GetPage(
        name: Routes.sales, page: () => Salesman(), binding: SalesmanBinding()),
    // GetPage(name: Routes.pic, page: () => PicListView(), binding: PicBinding()),
    GetPage(
        name: Routes.picResult,
        page: () => PicResultPage(),
        binding: PicResultBinding()),
    GetPage(
        name: Routes.account,
        page: () => AccountPage(),
        binding: AccountBinding()),
  ];
}
