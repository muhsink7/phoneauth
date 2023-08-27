
import 'package:get/get.dart';
import 'package:phoneauth_firebase/Authentication/authentication_repository.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepository());
  }
}