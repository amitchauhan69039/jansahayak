import 'dart:convert';

SpecialityModel specialityModelFromJson(String str) => SpecialityModel.fromJson(json.decode(str));

class SpecialityModel {
  String? output;
  List<SpecialityModelData>? data;
  String? reason;

  SpecialityModel({this.output, this.data, this.reason});

  SpecialityModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <SpecialityModelData>[];
      json['data'].forEach((v) {
        data!.add(new SpecialityModelData.fromJson(v));
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

class SpecialityModelData {
  String? shortCode;
  String? sName;

  SpecialityModelData({this.shortCode, this.sName});

  SpecialityModelData.fromJson(Map<String, dynamic> json) {
    shortCode = json['Short_Code'];
    sName = json['S_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Short_Code'] = this.shortCode;
    data['S_Name'] = this.sName;
    return data;
  }
}