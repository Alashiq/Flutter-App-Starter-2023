import 'package:flutter_app_starter/Features/MainController/main_controller.dart';
import 'package:get/get.dart';

class StartViewModel {
  MainAppController mainAppController = Get.find();

  get listData => () {
        return mainAppController.simpleList!.list;
      };

  get listStatus => () {
        return mainAppController.simpleList!.status!.arabic;
      };
  get messageList => () {
        return mainAppController.simpleList!.list;
      };
}
