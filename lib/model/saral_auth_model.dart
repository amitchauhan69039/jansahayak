import 'dart:convert';

SaralAuthModel saralAuthModelFromJson(String str) => SaralAuthModel.fromJson(json.decode(str));
class SaralAuthModel {
  int? statusCode;
  String? referenceNo;
  String? remarks;
  String? token;

  SaralAuthModel({this.statusCode, this.referenceNo, this.remarks, this.token});

  SaralAuthModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    referenceNo = json['reference_no'];
    remarks = json['remarks'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['reference_no'] = this.referenceNo;
    data['remarks'] = this.remarks;
    data['token'] = this.token;
    return data;
  }
}