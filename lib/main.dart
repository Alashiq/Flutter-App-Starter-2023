import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_starter/UI/employee_screen/employee_screen.dart';
import 'package:flutter_app_starter/UI/login_screen/login_screen.dart';
import 'package:flutter_app_starter/UI/onboarding_screen.dart/onboarding_screen.dart';
import 'package:flutter_app_starter/UI/profile_screen/profile_screen.dart';
import 'package:flutter_app_starter/UI/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'UI/home_screen/home_screen.dart';
import 'Utils/app_binding.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/onboarding', page: () => const OnBoardingScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/employee', page: () => const EmployeeScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
      ],
    );
  }
}
