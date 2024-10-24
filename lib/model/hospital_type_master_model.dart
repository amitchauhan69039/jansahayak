import 'dart:convert';

HospitalTypeMasterModel hospitalTypeMasterModelFromJson(String str) => HospitalTypeMasterModel.fromJson(json.decode(str));
class HospitalTypeMasterModel {
  String? output;
  List<HospitalTypeMasterData>? data;
  String? reason;

  HospitalTypeMasterModel({this.output, this.data, this.reason});

  HospitalTypeMasterModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <HospitalTypeMasterData>[];
      json['data'].forEach((v) {
        data!.add(new HospitalTypeMasterData.fromJson(v));
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

class HospitalTypeMasterData {
  int? id;
  String? type;

  HospitalTypeMasterData({this.id, this.type});

  HospitalTypeMasterData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Type'] = this.type;
    return data;
  }
}