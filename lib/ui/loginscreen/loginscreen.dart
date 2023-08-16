import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logincontroller.dart';


class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: loginController.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: TextEditingController(text: controller.mobileNumber.value),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  onChanged: controller.updateMobileNumber,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: controller.onLoginButtonPressed,
                  child: Text('Login'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}