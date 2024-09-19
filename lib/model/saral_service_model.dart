import 'dart:convert';

SaralServiceModel saralServiceModelFromJson(String str) => SaralServiceModel.fromJson(json.decode(str));
class SaralServiceModel {
  String? output;
  List<Data>? data;
  String? reason;

  SaralServiceModel({this.output, this.data, this.reason});

  SaralServiceModel.fromJson(Map<String, dynamic> json) {
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
  String? deptName;
  String? deptNameHindi;
  int? deptID;
  String? serviceName;
  String? serviceNameHindi;
  String? serviceID;
  String? clientID;
  String? headerParameter;
  String? serviceSerialNo;
  int? isDBT;
  String? serviceOnSaralOrDept;
  String? serviceUrl;
  String? categoryId;

  Data(
      {this.id,
        this.deptName,
        this.deptNameHindi,
        this.deptID,
        this.serviceName,
        this.serviceNameHindi,
        this.serviceID,
        this.clientID,
        this.headerParameter,
        this.serviceSerialNo,
        this.isDBT,
        this.serviceOnSaralOrDept,
        this.serviceUrl,
        this.categoryId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    deptName = json['DeptName'];
    deptNameHindi = json['DeptNameHindi'];
    deptID = json['DeptID'];
    serviceName = json['ServiceName'];
    serviceNameHindi = json['ServiceNameHindi'];
    serviceID = json['ServiceID'];
    clientID = json['Client_ID'];
    headerParameter = json['Header_Parameter'];
    serviceSerialNo = json['Service_SerialNo'];
    isDBT = json['Is_DBT'];
    serviceOnSaralOrDept = json['ServiceOnSaralOrDept'];
    serviceUrl = json['ServiceUrl'];
    categoryId = json['Category_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['DeptName'] = this.deptName;
    data['DeptNameHindi'] = this.deptNameHindi;
    data['DeptID'] = this.deptID;
    data['ServiceName'] = this.serviceName;
    data['ServiceNameHindi'] = this.serviceNameHindi;
    data['ServiceID'] = this.serviceID;
    data['Client_ID'] = this.clientID;
    data['Header_Parameter'] = this.headerParameter;
    data['Service_SerialNo'] = this.serviceSerialNo;
    data['Is_DBT'] = this.isDBT;
    data['ServiceOnSaralOrDept'] = this.serviceOnSaralOrDept;
    data['ServiceUrl'] = this.serviceUrl;
    data['Category_Id'] = this.categoryId;
    return data;
  }
}