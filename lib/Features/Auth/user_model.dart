import '../../Utils/loading_statud.dart';

class UserModel {
  LoadingStatus? status = LoadingStatus.NOT_STARTED;
  String? phone;
  String? firstname;
  String? lastname;
  String? photo;
  String? role;
  String? token;

  UserModel(
      {this.status,
      this.phone,
      this.firstname,
      this.lastname,
      this.photo,
      this.token,
      this.role});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      status: jsonData['status'],
      phone: jsonData['phone'] ?? '',
      firstname: jsonData['first_name'] ?? '',
      lastname: jsonData['last_name'] ?? '',
      photo: jsonData['photo'] ?? '',
      token: jsonData['token'] ?? '',
      role: jsonData['role'] ?? '',
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
