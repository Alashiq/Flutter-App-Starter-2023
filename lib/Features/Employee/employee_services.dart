import 'dart:convert';

import 'package:flutter_app_starter/Features/Court/statistic_model.dart';
import 'package:flutter_app_starter/Features/Employee/employee_model.dart';
import 'package:flutter_app_starter/Utils/logout.dart';
import 'package:flutter_app_starter/Widgets/errorMessage.dart';

import '../../Utils/api.dart';
import '../../Utils/loading.dart';
import '../../Utils/loading_statud.dart';

class EmployeeAPI extends SharedApi {
  Future<EmployeeListModel> loadEmployeeListAPI(int page, int count) async {
    try {
      showLoading();
      var data = await SharedApi().getAuth(
          urlPath:
              'employee?page=${page.toString()}&count=${count.toString()}');
      stopLoading();
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        return EmployeeListModel.fromJson({
          "status": LoadingStatus.DONE,
          "list": jsonData['data']['data'],
        });
      } else if (data.statusCode == 401) {
        Logout().logout();
        return EmployeeListModel.fromJson({
          "status": LoadingStatus.NOT_AUTH,
          "page": 0,
          "last_page": 1,
          "list": [],
        });
      } else if (data.statusCode == 204) {
        return EmployeeListModel.fromJson({
          "status": LoadingStatus.EMPTY,
          "page": 0,
          "last_page": 1,
          "list": [],
        });
      } else {
        return EmployeeListModel.fromJson({
          "status": LoadingStatus.BAD_REQUEST,
          "page": 0,
          "last_page": 1,
          "list": [],
        });
      }
    } on Exception catch (_) {
      stopLoading();
      return EmployeeListModel.fromJson({
        "status": LoadingStatus.NO_INTERNET,
        "page": 0,
        "last_page": 1,
        "list": [],
      });
    }
  }
}
