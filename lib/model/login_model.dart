import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));


class LoginModel {
  String? status;
  String? result;
  String? message;

  LoginModel({this.status, this.result, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['result'] = this.result;
    data['message'] = this.message;
    return data;
  }
}

