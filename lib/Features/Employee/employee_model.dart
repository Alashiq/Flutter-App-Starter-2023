import '../../Utils/loading_statud.dart';

class StatisticModel {
  LoadingStatus? status = LoadingStatus.NOT_STARTED;
  int? page = 1;
  int? Count = 1;
  int? last_page = 1;
  final List<EmployeeItemModel>? list;

  StatisticModel({
    this.status,
    this.list,
    this.page,
    this.last_page,
  });

  factory StatisticModel.fromJson(Map<String, dynamic> jsonData) {
    return StatisticModel(
      status: jsonData['status'],
      page: jsonData['page'],
      last_page: jsonData['last_page'],
      list: jsonData['list']
          .map<EmployeeItemModel>((data) => EmployeeItemModel.fromJson(data))
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

//

class EmployeeItemModel {
  int? id;
  String? name;
  String? job;
  String? phone;

  EmployeeItemModel({
    this.id,
    this.name,
    this.phone,
    this.job,
  });

  factory EmployeeItemModel.fromJson(Map<String, dynamic> jsonData) {
    return EmployeeItemModel(
      id: jsonData['id'],
      name: jsonData['name'].toString(),
      phone: jsonData['phone'].toString(),
      job: jsonData['job'].toString(),
    );
  }
}
