import 'dart:convert';
import 'package:flutter_app_starter/Features/MainController/main_model_list.dart';

import '../../Utils/api.dart';
import '../../Utils/loading.dart';
import '../../Utils/loading_statud.dart';

class MainApi extends SharedApi {
  // Login API
  Future<SimpleListModel> loadSimpleApi() async {
    try {
      var jsonData;
      showLoading();
      var data = await SharedApi().getNoAuth(urlPath: 'message?page=1&count=2');
      stopLoading();
      print(data.statusCode);
      jsonData = json.decode(data.body);
      print(jsonData['data']);
      if (data.statusCode == 200) {
        return SimpleListModel.fromJson({
          "status": LoadingStatus.DONE,
          "list": jsonData['data']['data'],
        });
      } else {
        return SimpleListModel.fromJson({
          "status": data.statusCode,
          "list": [],
        });
      }
    } on Exception catch (_) {
      stopLoading();
      return SimpleListModel.fromJson({
        "status": LoadingStatus.NO_INTERNET,
        "list": [],
      });
    }
  }

  // End API
}
