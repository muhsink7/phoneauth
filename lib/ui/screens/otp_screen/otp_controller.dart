import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Authentication/authentication_repository.dart';
import '../../../router.dart';

class OtpController extends GetxController {

  static OtpController get instance => Get.find();

  late TextEditingController otpTextController;

  @override
  void onInit() {
    otpTextController = TextEditingController();
    super.onInit();
  }

  var otp = '';

  void setOtp(String value) {
    otp = value;
  }

  void verifyOtp() async {
    if (otp.isNotEmpty) { // Check if otp is not empty
      var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
      isVerified ? Get.offAndToNamed(RoutePaths.mainScreen) : Get.back();
    } else {
      // Handle the case where otp is empty
      // You might want to show an error message or take appropriate action
      print("OTP is empty");
    }
  }

  void resendOtp() {
    // Add your logic to resend the OTP here
  }
}

