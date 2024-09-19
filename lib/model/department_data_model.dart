import 'dart:convert';

DepartmentDataModel departmentDataModelFromJson(String str) => DepartmentDataModel.fromJson(json.decode(str));
class DepartmentDataModel {
  String? output;
  List<Data>? data;
  String? reason;

  DepartmentDataModel({this.output, this.data, this.reason});

  DepartmentDataModel.fromJson(Map<String, dynamic> json) {
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
  String? department;
  String? hDepName;
  String? code;
  int? status;
  int? setOrder;
  String? deptLogo;
  String? deptcode;

  Data(
      {this.id,
        this.department,
        this.hDepName,
        this.code,
        this.status,
        this.setOrder,
        this.deptLogo,
        this.deptcode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    department = json['Department'];
    hDepName = json['H_DepName'];
    code = json['code'];
    status = json['status'];
    setOrder = json['SetOrder'];
    deptLogo = json['Dept_logo'];
    deptcode = json['deptcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Department'] = this.department;
    data['H_DepName'] = this.hDepName;
    data['code'] = this.code;
    data['status'] = this.status;
    data['SetOrder'] = this.setOrder;
    data['Dept_logo'] = this.deptLogo;
    data['deptcode'] = this.deptcode;
    return data;
  }
}