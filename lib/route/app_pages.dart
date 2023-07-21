import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ignou_project/ui/auth/login.dart';
import 'package:ignou_project/ui/auth/register.dart';
import '../ui/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.root;
  static final routes = [
    GetPage(
        name: Routes.root,
        page: () => Splashscreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.login,
        page: () => LoginScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.registration,
        page: () => RegisterScreen(),
        transition: Transition.downToUp),

  ];
}
