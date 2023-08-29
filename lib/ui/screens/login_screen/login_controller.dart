import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:phoneauth_firebase/Authentication/authentication_repository.dart';

import '../../../router.dart';

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

  Future<void> phoneAuthentication(String phoneNo) async {
    print(phoneNo);
    if (phoneNo.isNotEmpty) {
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://15.206.68.154:5000/users/sendOTP'));
      request.body = json.encode({
        "phoneNumber": "$phoneNo",
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Get.toNamed(RoutePaths.otpScreen, arguments: phoneNo);
      }
      else {
        print(response.reasonPhrase);
      }
      // AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  
    } else {
      Get.snackbar("Error", "Not found a Mobile Number");
    }
  }
}
