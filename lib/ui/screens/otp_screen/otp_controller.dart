import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:phoneauth_firebase/Model/kyc_model/kyc_update.dart';

// import '../../../Authentication/authentication_repository.dart';
import '../../../router.dart';
import '../menu_contents/kyc_details/kyc_controller.dart';



class OtpController extends GetxController {

  static OtpController get instance => Get.find();
  final KYCController kycController = Get.put(KYCController());
  final box = GetStorage();

  late TextEditingController otpTextController;

  var isVerified;
  var userId;
  var phoneNumber;
  var responseData;

  List<KycUpdate> kycUpdateData = [];

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
    if (otp.isNotEmpty) {
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://15.206.68.154:5000/users/verifyOTP'));
      request.body = json.encode({
        "phoneNumber": Get.arguments,
        "otp": otp,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseString = await response.stream.bytesToString(); // Listen to the stream once

      if (response.statusCode == 200) {
        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
         responseData = json.decode(responseString);
         userId = responseData['userId'];
         phoneNumber = Get.arguments;
        // kycUpdateData = List<KycUpdate>.from(json.decode(responseString).map((x) => KycUpdate.fromJson(x)));
        print(kycUpdateData);
        isVerified = true;
        kycController.kycUpdate(userId, phoneNumber);
        box.write('kycUpdateData', responseString);
        box.write('is_authenticated', true);
        print(responseString);
        isVerified = true;
      } else {
        print(response.reasonPhrase);
        isVerified = false;
      }

      isVerified ? Get.toNamed(RoutePaths.mainScreen) : Get.back();
    } else {
      print("OTP is empty");
    }
  }


  void resendOtp() {
    // Add your logic to resend the OTP here
  }
}

