import 'package:flutter/widgets.dart';
import 'package:flutter_app_starter/Utils/shared_preferences.dart';
import 'package:get/get.dart';

import '../Features/Auth/auth_controller.dart';
import '../Features/Auth/user_model.dart';
import 'loading_statud.dart';

screenHeight(BuildContext context, double val) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      val;
}
