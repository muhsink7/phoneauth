import 'package:get/get.dart';
import 'package:phoneauth_firebase/ui/screens/cashier_screen/cashier_controller.dart';




class CashierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashierController());
  }
}