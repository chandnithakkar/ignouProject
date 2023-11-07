import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ignou_project/ui/admin/add_dog_screen.dart';
import 'package:ignou_project/ui/admin/add_trainer_screen.dart';
import 'package:ignou_project/ui/admin/admin_dashboard.dart';
import 'package:ignou_project/ui/auth/admin_login.dart';
import 'package:ignou_project/ui/auth/login.dart';
import 'package:ignou_project/ui/auth/register.dart';
import 'package:ignou_project/ui/user/booking_screen.dart';
import '../ui/admin/admin_dog_list.dart';
import '../ui/auth/verify_otp_screen.dart';
import '../ui/splash_screen.dart';
import '../ui/user/dogs_details.dart';
import '../ui/user/dogs_list_screen.dart';
import '../ui/user/orders_list_screen.dart';
import '../ui/user/payment_screen.dart';
import '../ui/user/user_dashboard.dart';
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
    GetPage(
        name: Routes.verifyOtp,
        page: () => VerifyMobileOtp(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.verifyOtp,
        page: () => VerifyMobileOtp(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.adminLogin,
        page: () => AdminLoginScreen(),
        transition: Transition.downToUp),

    GetPage(
        name: Routes.adminDashboard,
        page: () => AdminDashboard(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.addDogScreen,
        page: () => AddDogScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.addTrainerScreen,
        page: () => AddTrainerScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.UserDashboard,
        page: () => UserDashboard(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.dogDetailsScreen,
        page: () => DogDetailsScreen(),
        transition: Transition.downToUp),
    GetPage(
            name: Routes.DogsList,
        page: () => DogListScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.bookingScreen,
        page: () => BookingScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.paymentScreen,
        page: () => PaymentScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.orderListScreen,
        page: () => OrderListScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.adminDogsList,
        page: () => AdminDogListScreen(),
        transition: Transition.downToUp),
  ];
}
