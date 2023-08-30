

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../ui/screens/login_screen/login_screen.dart';
import '../ui/screens/main_Screen/main_screen.dart';

class AuthChecker extends StatelessWidget {
  final GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    bool isUserAuthenticated = storage.read('is_authenticated') ?? false;

    return isUserAuthenticated
        ? MainScreen()
        : LoginScreen();
  }
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // @override
  // Widget build(BuildContext context) {
  //   return StreamBuilder<User?>(
  //     stream: _auth.authStateChanges(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.active) {
  //         final user = snapshot.data;
  //         if (user == null) {
  //           // User is not logged in, navigate to LoginScreen
  //           return LoginScreen();
  //         } else {
  //           // User is logged in, navigate to MainScreen
  //           return MainScreen();
  //         }
  //       } else {
  //         // Show loading or splash screen if connection state is not active
  //         return CircularProgressIndicator(); // Placeholder, you can replace this
  //       }
  //     },
  //   );
  // }
}