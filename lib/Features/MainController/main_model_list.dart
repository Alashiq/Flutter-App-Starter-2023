import 'package:flutter_app_starter/Utils/loading_statud.dart';

class SimpleListModel {
  LoadingStatus? status = LoadingStatus.NOT_STARTED;
  int? page = 1;
  int? Count = 10;
  int? last_page = 1;

  // final LoadingStatus? status;
  final List<SimpleItemModel>? list;

  SimpleListModel({
    this.status,
    this.list,
    this.page,
    this.last_page,
  });

  factory SimpleListModel.fromJson(Map<String, dynamic> jsonData) {
    return SimpleListModel(
      status: jsonData['status'],
      page: jsonData['page'],
      last_page: jsonData['last_page'],
      list: jsonData['list']
          .map<SimpleItemModel>((data) => SimpleItemModel.fromJson(data))
          .toList(),
    );
  }

  bool isNotStarted() {
    if (status!.value == 0) return true;
    return false;
  }

  bool isLoading() {
    if (status!.value == 1) return true;
    return false;
  }

  bool isLoadSuccess() {
    if (status!.value == 200) return true;
    return false;
  }

  bool isEmpty() {
    if (status!.value == 204) return true;
    return false;
  }

  bool isBadRequest() {
    if (status!.value == 400) return true;
    return false;
  }

  bool isNotAuth() {
    if (status!.value == 401) return true;
    return false;
  }

  bool isNoInternet() {
    if (status!.value == 404) return true;
    return false;
  }
}

class SimpleItemModel {
  int? id;
  String? name;

  SimpleItemModel({
    this.id,
    this.name,
  });

  factory SimpleItemModel.fromJson(Map<String, dynamic> jsonData) {
    return SimpleItemModel(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }
}
