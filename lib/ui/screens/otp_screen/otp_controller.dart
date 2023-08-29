import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

// import '../../../Authentication/authentication_repository.dart';
import '../../../router.dart';

class OtpController extends GetxController {

  static OtpController get instance => Get.find();

  late TextEditingController otpTextController;
  var isVerified;

  @override
  void onInit() {
    otpTextController = TextEditingController();
    super.onInit();
  }

  var otp = '';

  void setOtp(String value) {
    otp = value;
  }

  Future<void> verifyOtp() async {
    if (otp.isNotEmpty) { // Check if otp is not empty
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://15.206.68.154:5000/users/verifyOTP'));
      request.body = json.encode({
        "phoneNumber": Get.arguments, // Get the phoneNo argument from the previous screen
        "otp": otp // Use the entered OTP
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        isVerified = true; // Set isVerified to true if OTP is verified
      } else {
        print(response.reasonPhrase);
        isVerified = false; // Set isVerified to false if OTP is not verified
      }

      // var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);

      isVerified ? Get.offAndToNamed(RoutePaths.mainScreen) : Get.back();
    } else {
      print("OTP is empty");
    }

  }

  void resendOtp() {
    // Add your logic to resend the OTP here
  }
}

