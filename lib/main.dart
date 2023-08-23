import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phoneauth_firebase/ui/screens/splash_screen/splash_binding.dart';


import 'Authentication/authentication_repository.dart';
import 'constants/color_constants.dart';
import 'firebase_options.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,)
      .then((value) => Get.lazyPut(() => AuthenticationRepository()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      initialRoute: RoutePaths.splash,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}


