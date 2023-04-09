import 'package:flutter_app_starter/Features/Court/court_controller.dart';
import 'package:flutter_app_starter/Features/Employee/employee_controller.dart';
import 'package:get/get.dart';

import '../Features/Auth/auth_controller.dart';
import '../Features/MainController/main_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<CourtController>(CourtController());
    Get.put<EmployeeController>(EmployeeController());
    Get.put<MainAppController>(MainAppController());
  }
}
