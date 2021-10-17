import 'package:get/get.dart';

import 'package:epaypodcoderwithgetx/app/modules/auth/forgetpass/bindings/auth_forgetpass_binding.dart';
import 'package:epaypodcoderwithgetx/app/modules/auth/forgetpass/views/auth_forgetpass_view.dart';
import 'package:epaypodcoderwithgetx/app/modules/auth/login/bindings/auth_login_binding.dart';
import 'package:epaypodcoderwithgetx/app/modules/auth/login/views/auth_login_view.dart';
import 'package:epaypodcoderwithgetx/app/modules/auth/register/bindings/auth_register_binding.dart';
import 'package:epaypodcoderwithgetx/app/modules/auth/register/views/auth_register_view.dart';
import 'package:epaypodcoderwithgetx/app/modules/home/bindings/home_binding.dart';
import 'package:epaypodcoderwithgetx/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const AUTH = Routes.AUTH_LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_LOGIN,
      page: () => AuthLoginView(),
      binding: AuthLoginBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_REGISTER,
      page: () => AuthRegisterView(),
      binding: AuthRegisterBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_FORGETPASS,
      page: () => AuthForgetpassView(),
      binding: AuthForgetpassBinding(),
    ),
  ];
}
