import 'package:flutter_app_starter/Features/Court/statistic_model.dart';
import 'package:get/get.dart';

import '../../Utils/loading_statud.dart';
import 'employee_services.dart';

class EmployeeController extends GetxController {
// ========================================
// =========== Login ================
// ========================================

  StatisticModel? statistic = StatisticModel.fromJson({
    "status": LoadingStatus.NOT_STARTED,
  });
  Future loadStatistic() async {
    statistic!.status = LoadingStatus.IN_PROGRESS;
    update();
    statistic = await EmployeeAPI().loadStatisticAPI();
    update();
  }
}
