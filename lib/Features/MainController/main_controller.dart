import 'package:flutter_app_starter/Features/MainController/main_model_list.dart';
import 'package:flutter_app_starter/Utils/loading_statud.dart';
import 'package:get/get.dart';

import 'main_services.dart';

class MainAppController extends GetxController {
  SimpleListModel? simpleList = SimpleListModel.fromJson({
    "status": LoadingStatus.NOT_STARTED,
    "page": 0,
    "last_page": 1,
    "list": [],
  });
  int onboarding = 0;

  startFunction() async {
    await Future.delayed(Duration(milliseconds: 4000), () {});
    Get.offAndToNamed("/onboarding");
  }

  loadData() async {
    simpleList!.status = LoadingStatus.IN_PROGRESS;
    update();
    await Future.delayed(Duration(milliseconds: 100), () {});
    simpleList = await MainApi().loadSimpleApi();
    update();
  }
}
