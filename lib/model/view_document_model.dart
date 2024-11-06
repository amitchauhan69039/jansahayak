import 'dart:convert';

ViewDocumentModel viewDocumentModelFromJson(String str) => ViewDocumentModel.fromJson(json.decode(str));
class ViewDocumentModel {
  Result? result;
  String? status;
  String? message;

  ViewDocumentModel({this.result, this.status, this.message});

  ViewDocumentModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  String? document;

  Result({this.document});

  Result.fromJson(Map<String, dynamic> json) {
    document = json['document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document'] = this.document;
    return data;
  }
}