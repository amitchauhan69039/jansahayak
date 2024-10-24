import 'dart:convert';

CastCertificateModel castCertificateModelFromJson(String str) => CastCertificateModel.fromJson(json.decode(str));
class CastCertificateModel {
  String? message;
  String? status;
  ResultEntity? result;

  CastCertificateModel({this.message, this.status, this.result});

  factory CastCertificateModel.fromJson(Map<String, dynamic> json) {
    return CastCertificateModel(
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
  String? certificateType;
  String? data;

  ResultEntity({this.certificateType, this.data});


  factory ResultEntity.fromJson(Map<String, dynamic> json) {
    return ResultEntity(
      certificateType: json['certificateType'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'certificateType': certificateType,
      'data': data,
    };
  }
}

