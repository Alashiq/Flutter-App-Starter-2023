import 'package:flutter_app_starter/Features/Court/statistic_model.dart';
import 'package:get/get.dart';

import '../../Utils/loading_statud.dart';
import 'court_services.dart';

class CourtController extends GetxController {
// ========================================
// =========== Login ================
// ========================================

  StatisticModel? statistic = StatisticModel.fromJson({
    "status": LoadingStatus.NOT_STARTED,
  });
  Future loadStatistic() async {
    statistic!.status = LoadingStatus.IN_PROGRESS;
    update();
    statistic = await CourtAPI().loadStatisticAPI();
    update();
  }
}
