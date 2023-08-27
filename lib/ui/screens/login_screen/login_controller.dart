import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phoneauth_firebase/Authentication/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final countryCodeController = TextEditingController(text: "+91");
  final phoneNumber = TextEditingController();
  String phoneNo = '';

  void phoneNumberWithCode() {
    phoneNo = '${countryCodeController.text.trim()}${phoneNumber.text.trim()}';
    print(phoneNo);
    update();
  }
  void onCountryCodeChanged(String value) {
    phoneNumberWithCode();
    update();
  }

  void onPhoneNumberChanged(String value) {
    phoneNumberWithCode();
    update();
  }

  void phoneAuthentication(String phoneNo) {
    print(phoneNo);
    if (phoneNo.isNotEmpty) {
      AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    } else {
      Get.snackbar("Error", "Not found a Mobile Number");
    }
  }
}
