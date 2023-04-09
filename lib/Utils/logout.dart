import 'package:flutter_app_starter/Utils/shared_preferences.dart';
import 'package:get/get.dart';

import '../Features/Auth/auth_controller.dart';
import '../Features/Auth/user_model.dart';
import 'loading_statud.dart';

class Logout {
  logout() {
    AuthController authController = Get.find();
    Get.offNamed("/login");
    authController.user =
        UserModel.fromJson({"status": LoadingStatus.NO_INTERNET});
    removeString("token");
    print("logout is Done");
  }
}
