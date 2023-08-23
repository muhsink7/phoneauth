import 'package:get/get.dart';
import 'package:phoneauth_firebase/ui/screens/splash_screen/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}