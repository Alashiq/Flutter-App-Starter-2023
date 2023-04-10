import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_starter/Features/Employee/employee_model.dart';
import 'package:flutter_app_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../Utils/api.dart';
import '../../Utils/loading.dart';
import '../../Utils/loading_statud.dart';

class EmployeeAPI extends SharedApi {
  Future<EmployeeListModel> loadEmployeeListAPI({int page = 1}) async {
    try {
      await Future.delayed(Duration(milliseconds: 1000), () {});
      var data = await SharedApi()
          .getAuth(urlPath: 'employee?page=${page.toString()}&count=1');
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        return EmployeeListModel.fromJson({
          "status": LoadingStatus.DONE,
          "page": page + 1,
          "last_page": jsonData['data']['last_page'],
          "list": jsonData['data']['data'],
        });
      } else if (data.statusCode == 401) {
        Logout().logout();
        return EmployeeListModel.fromJson({
          "status": LoadingStatus.NOT_AUTH,
          "page": page,
          "last_page": 1,
          "list": [],
        });
      } else if (data.statusCode == 204) {
        Get.snackbar(
            "تنبيه", page == 1 ? "لايوجد اي عناصر" : "وصلت لنهاية القائمة",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff6a6a6a),
            colorText: Colors.white);
        return EmployeeListModel.fromJson({
          "status": LoadingStatus.EMPTY,
          "page": page,
          "last_page": 1,
          "list": [],
        });
      } else {
        Get.snackbar("تنبيه", "حدث خطأ ما",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff6a6a6a),
            colorText: Colors.white);
        return EmployeeListModel.fromJson({
          "status": LoadingStatus.BAD_REQUEST,
          "page": page,
          "last_page": 1,
          "list": [],
        });
      }
    } on Exception catch (_) {
      Get.snackbar("تنبيه", "تأكد من إتصالك بالإنترنت",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff6a6a6a),
          colorText: Colors.white);
      return EmployeeListModel.fromJson({
        "status": LoadingStatus.NO_INTERNET,
        "page": 1,
        "last_page": 1,
        "list": [],
      });
    }
  }
}
