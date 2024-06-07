import 'package:e_rapor/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:e_rapor/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:get/get.dart';

import '../modules/add_murid/bindings/add_murid_binding.dart';
import '../modules/add_murid/views/add_murid_view.dart';
import '../modules/edit_murid/bindings/edit_murid_binding.dart';
import '../modules/edit_murid/views/edit_murid_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/rapor/bindings/rapor_binding.dart';
import '../modules/rapor/views/rapor_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RAPOR,
      page: () => const RaporView(),
      binding: RaporBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MURID,
      page: () => AddMuridView(),
      binding: AddMuridBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MURID,
      page: () => EditMuridView(),
      binding: EditMuridBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}
