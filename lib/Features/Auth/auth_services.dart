import 'dart:convert';

import 'package:flutter_app_starter/Features/Auth/user_model.dart';
import 'package:flutter_app_starter/Widgets/errorMessage.dart';

import '../../Utils/api.dart';
import '../../Utils/loading.dart';
import '../../Utils/loading_statud.dart';

class AuthAPI extends SharedApi {
  // Login API
  Future<UserModel> loginAPI(String phone, String password) async {
    try {
      showLoading();
      var data = await SharedApi().postNoAuth(
        urlPath: 'login',
        bodyData: json.encode({
          'phone': phone,
          'password': password,
        }),
      );
      stopLoading();
      var jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['admin']['status'] = LoadingStatus.DONE;
        return UserModel.fromJson(jsonData['admin']);
      } else {
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": LoadingStatus.BAD_REQUEST});
      }
    } on Exception catch (_) {
      stopLoading();
      return UserModel.fromJson({"status": LoadingStatus.NO_INTERNET});
    }
  }

  // Auth API
  Future<UserModel> authAPI() async {
    try {
      showLoading();
      var data = await SharedApi().getAuth(
        urlPath: 'auth/auth',
      );
      stopLoading();
      var jsonData = json.decode(data.body);
      print(data.statusCode);
      if (data.statusCode == 200) {
        jsonData['admin']['status'] = LoadingStatus.DONE;
        return UserModel.fromJson(jsonData['admin']);
      } else {
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": LoadingStatus.BAD_REQUEST});
      }
    } on Exception catch (_) {
      stopLoading();
      return UserModel.fromJson({"status": LoadingStatus.NO_INTERNET});
    }
  }
}
