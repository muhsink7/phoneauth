
import 'package:get/get.dart';

import 'authentication_repository.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepository());
  }
}