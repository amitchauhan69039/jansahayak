

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));
class VerifyOtpModel {
  String? reason;
  List<DataEntity>? data;
  String? output;

  VerifyOtpModel({this.reason, this.data, this.output});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      reason: json['reason'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => DataEntity.fromJson(item))
          .toList(),
      output: json['output'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reason': reason,
      'data': data?.map((item) => item.toJson()).toList(),
      'output': output,
    };
  }
}

class DataEntity {
  String? address;
  String? familyname;
  String? familymobile;
  String? familyemail;
  String? memberid;
  String? dob;
  String? gender;
  String? pppid;
  String? userId;

  DataEntity({
    this.address,
    this.familyname,
    this.familymobile,
    this.familyemail,
    this.memberid,
    this.dob,
    this.gender,
    this.pppid,
    this.userId,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    return DataEntity(
      address: json['Address'],
      familyname: json['FamilyName'],
      familymobile: json['FamilyMobile'],
      familyemail: json['FamilyEmail'],
      memberid: json['Memberid'],
      dob: json['DOB'],
      gender: json['Gender'],
      pppid: json['PPPID'],
      userId: json['UserId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Address': address,
      'FamilyName': familyname,
      'FamilyMobile': familymobile,
      'FamilyEmail': familyemail,
      'Memberid': memberid,
      'DOB': dob,
      'Gender': gender,
      'PPPID': pppid,
      'UserId': userId,
    };
  }
}

