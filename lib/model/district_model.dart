import 'dart:convert';

DistrictModel districtModelFromJson(String str) => DistrictModel.fromJson(json.decode(str));
class DistrictModel {
  String? output;
  List<DistrictData>? data;
  String? reason;

  DistrictModel({this.output, this.data, this.reason});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <DistrictData>[];
      json['data'].forEach((v) {
        data!.add(new DistrictData.fromJson(v));
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

class DistrictData {
  int? id;
  String? district;

  DistrictData({this.id, this.district});

  DistrictData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    district = json['District'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['District'] = this.district;
    return data;
  }
}