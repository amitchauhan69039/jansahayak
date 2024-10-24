import 'dart:convert';

MarriageCertificateModel marriageCertificateModelFromJson(String str) => MarriageCertificateModel.fromJson(json.decode(str));


class MarriageCertificateModel {
  String? status;
  String? link;
  String? message;

  MarriageCertificateModel({this.status, this.link, this.message});

  MarriageCertificateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    link = json['link'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['link'] = this.link;
    data['message'] = this.message;
    return data;
  }
}

