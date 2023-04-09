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
}
