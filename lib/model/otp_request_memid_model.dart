import 'dart:convert';

OtpRequestMemidModel otpRequestMemidModelFromJson(String str) => OtpRequestMemidModel.fromJson(json.decode(str));
class OtpRequestMemidModel {
  String? message;
  String? status;
  ResultEntity? result;

  OtpRequestMemidModel({this.message, this.status, this.result});

  factory OtpRequestMemidModel.fromJson(Map<String, dynamic> json) {
    return OtpRequestMemidModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
      result: json['result'] != null
          ? ResultEntity.fromJson(json['result'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'result': result?.toJson(),
    };
  }
}


ResultEntity ResultEntityFromJson(String str) => ResultEntity.fromJson(json.decode(str));
class ResultEntity {
  String? txn;
  String? message;
  String? status;
  String? mobileNo;

  ResultEntity({this.txn, this.message,this.status,this.mobileNo,});


  factory ResultEntity.fromJson(Map<String, dynamic> json) {
    return ResultEntity(
      txn: json['txn'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      mobileNo: json['mobileNo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'txn': txn,
      'message': message,
      'status': status,
    'mobileNo': mobileNo,
    };
  }
}

