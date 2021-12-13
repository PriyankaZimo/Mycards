class LoginModel {
  int? code;
  String? message;
  Data data;

  LoginModel({required this.code, required this.message, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      code: json["code"],
      message: json["message"],
      data: Data.fromJson(json['data']));
}
class Data {
  UserInfo? userInfo;

  Data({
    required this.userInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(userInfo: UserInfo.fromJson(json["userInfo"]));
}

class UserInfo {
  String? firstName;
  String? lastName;
  dynamic mobile_no;
  String? email;

  UserInfo(
      {required this.firstName,
        required this.lastName,
        required this.mobile_no,
        required this.email});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
      firstName: json["firstName"],
      lastName: json["lastName"],
      mobile_no: json['mobile_no'],
      email: json['email']);
}

