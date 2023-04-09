import '../../Utils/loading_statud.dart';

class StatisticModel {
  LoadingStatus? status = LoadingStatus.NOT_STARTED;
  String? employees;
  String? buildings;
  String? departments;
  String? units;
  String? sections;
  String? a;

  StatisticModel(
      {this.status,
      this.employees,
      this.buildings,
      this.departments,
      this.units,
      this.sections,
      this.a});

  factory StatisticModel.fromJson(Map<String, dynamic> jsonData) {
    return StatisticModel(
      status: jsonData['status'],
      employees: jsonData['employees'].toString(),
      buildings: jsonData['buildings'].toString(),
      departments: jsonData['departments'].toString(),
      units: jsonData['units'].toString(),
      sections: jsonData['sections'].toString(),
      a: jsonData['a'].toString(),
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
