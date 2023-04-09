import 'dart:convert';

import 'package:flutter_app_starter/Features/Court/statistic_model.dart';
import 'package:flutter_app_starter/Utils/logout.dart';
import 'package:flutter_app_starter/Widgets/errorMessage.dart';

import '../../Utils/api.dart';
import '../../Utils/loading.dart';
import '../../Utils/loading_statud.dart';

class CourtAPI extends SharedApi {
  // Login API
  Future<StatisticModel> loadStatisticAPI() async {
    try {
      showLoading();
      await Future.delayed(Duration(milliseconds: 1000), () {});
      var data = await SharedApi().getAuth(urlPath: 'home');
      stopLoading();
      var jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['data']['status'] = LoadingStatus.DONE;
        return StatisticModel.fromJson(jsonData['data']);
      } else if (data.statusCode == 204) {
        return StatisticModel.fromJson({"status": LoadingStatus.EMPTY});
      } else if (data.statusCode == 401) {
        Logout().logout();
        return StatisticModel.fromJson({"status": LoadingStatus.NOT_AUTH});
      } else {
        showErrorMessage(jsonData['message']);
        return StatisticModel.fromJson({"status": LoadingStatus.BAD_REQUEST});
      }
    } on Exception catch (_) {
      stopLoading();
      return StatisticModel.fromJson({"status": LoadingStatus.NO_INTERNET});
    }
  }
}
