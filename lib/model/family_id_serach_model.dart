import 'dart:convert';

FamilyIdSerachModel familyIdSerachModelFromJson(String str) => FamilyIdSerachModel.fromJson(json.decode(str));
class FamilyIdSerachModel {
  Result? result;
  String? status;
  String? message;

  FamilyIdSerachModel({this.result, this.status, this.message});

  FamilyIdSerachModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? message;
  String? txn;


  Result(
      {this.status,
        this.message,
        this.txn,
       });

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    txn = json['txn'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['txn'] = this.txn;
    return data;
  }
}