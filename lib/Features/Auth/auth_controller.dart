import 'package:flutter_app_starter/Features/Auth/auth_services.dart';
import 'package:flutter_app_starter/Features/Auth/user_model.dart';
import 'package:flutter_app_starter/Utils/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Utils/loading_statud.dart';

class AuthController extends GetxController {
  final box = GetStorage();
// ========================================
// =========== Booting App ================
// ========================================
  booting() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    removeString("onboarding");
    if (await loadString("onboarding") == null)
      Get.offAndToNamed("/onboarding");
    else
      checkAuth();
  }

// ========================================
// =========== End Boarding ================
// ========================================
  int onboarding = 0;
  endBoarding() async {
    await saveString("onboarding", "done");
    print(await loadString("onboarding"));
    Get.offAndToNamed("/login");
  }

// ========================================
// =========== Check Auth ================
// ========================================
  checkAuth() async {
    if (await loadString("token") == null)
      Get.offAndToNamed("/login");
    else {
      user = await UserModel.fromJson({"token": await loadString("token")});
      user = await AuthAPI().authAPI();
      Get.offAndToNamed("/home");
    }
  }

// ========================================
// =========== Login ================
// ========================================
  UserModel? user;
  Future<bool> login(String phoneIn, String passwordIn) async {
    user = await AuthAPI().loginAPI(phoneIn, passwordIn);
    if (user!.status!.value == 200) {
      Get.offAndToNamed("/home");
      saveString("token", user!.token!);
      return true;
    }
    return false;
  }
}
