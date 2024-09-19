import 'dart:convert';

RegisterMobileModel registerMobileModelFromJson(String str) => RegisterMobileModel.fromJson(json.decode(str));

class RegisterMobileModel {
  String? output;
  List<Data>? data;
  String? reason;

  RegisterMobileModel({this.output, this.data, this.reason});

  RegisterMobileModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['output'] = this.output;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['reason'] = this.reason;
    return data;
  }
}

class Data {
  int? id;
  Null? pPPID;
  String? name;
  String? mobile;
  Null? email;
  Null? alternateMobile;
  Null? userId;
  String? address;
  Null? dOB;
  String? gender;
  Null? memberid;
  String? tokenid;
  String? type;

  Data(
      {this.id,
        this.pPPID,
        this.name,
        this.mobile,
        this.email,
        this.alternateMobile,
        this.userId,
        this.address,
        this.dOB,
        this.gender,
        this.memberid,
        this.tokenid,
        this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    pPPID = json['PPPID'];
    name = json['Name'];
    mobile = json['Mobile'];
    email = json['Email'];
    alternateMobile = json['AlternateMobile'];
    userId = json['User_id'];
    address = json['Address'];
    dOB = json['DOB'];
    gender = json['Gender'];
    memberid = json['Memberid'];
    tokenid = json['Tokenid'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['PPPID'] = this.pPPID;
    data['Name'] = this.name;
    data['Mobile'] = this.mobile;
    data['Email'] = this.email;
    data['AlternateMobile'] = this.alternateMobile;
    data['User_id'] = this.userId;
    data['Address'] = this.address;
    data['DOB'] = this.dOB;
    data['Gender'] = this.gender;
    data['Memberid'] = this.memberid;
    data['Tokenid'] = this.tokenid;
    data['Type'] = this.type;
    return data;
  }
}