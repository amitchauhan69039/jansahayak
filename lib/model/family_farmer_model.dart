import 'dart:convert';

FamilyFarmerModel familyFarmerModelFromJson(String str) => FamilyFarmerModel.fromJson(json.decode(str));
class FamilyFarmerModel {
  String? output;
  List<Data>? data;
  String? reason;

  FamilyFarmerModel({this.output, this.data, this.reason});

  FamilyFarmerModel.fromJson(Map<String, dynamic> json) {
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
  String? text;
  String? value;

  Data({this.text, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    text = json['Text'];
    value = json['Value'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Text'] = this.text;
    data['Value'] = this.value;
    return data;
  }
}