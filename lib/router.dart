
import 'package:get/get.dart';

import 'package:phoneauth_firebase/ui/home_screen/home_binding.dart';
import 'package:phoneauth_firebase/ui/home_screen/home_screen.dart';
import 'package:phoneauth_firebase/ui/loginscreen/loginbinding.dart';
import 'package:phoneauth_firebase/ui/loginscreen/loginscreen.dart';
import 'package:phoneauth_firebase/ui/otp_screen/otp_binding.dart';
import 'package:phoneauth_firebase/ui/otp_screen/otp_screen.dart';

class RoutePaths {
  // static const String splash = '/';
  static const String loginScreen = '/login';
  static const String otpScreen = '/otp';
  static const String homeScreen = '/home';
  // static const String menuScreen = '/menu';
  // static const String mainScreen = '/main';



}

class AppPages {
  static final List<GetPage> pages = [
    // GetPage(
    //   name: RoutePaths.splash,
    //   binding: SplashBinding(),
    //   page: () =>  SplashScreen(),
    // ),

    GetPage(
      name: RoutePaths.loginScreen,
      binding: LoginBinding(),
      page: () => LoginScreen(),
    ),

    GetPage(
      name: RoutePaths.otpScreen,
      binding: OtpBinding(),
      page: () =>  OtpScreen(),
    ),

    GetPage(
      name: RoutePaths.homeScreen,
      binding: HomeBinding(),
      page: () =>  HomeScreen(),
    ),

    // GetPage(
    //   name: RoutePaths.menuScreen,
    //   binding: MenuCardBinding(),
    //   page: () =>  MenuCardScreen(),
    // ),


    // GetPage(
    //   name: RoutePaths.mainScreen,
    //   binding: MainBinding(),
    //   page: () =>  MainScreen(),
    // ),



  ];
}
