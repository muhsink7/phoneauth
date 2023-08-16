import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phoneauth_firebase/ui/loginscreen/loginbinding.dart';

import 'constants/color_constants.dart';
import 'router.dart'; // Import Get package


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        useMaterial3: true,
      ),
      title: 'IRF',
      initialRoute: RoutePaths.loginScreen,
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
