import 'dart:convert';

import 'nearby_hospital_model.dart';

ListHospitalModel listHospitalModelFromJson(String str) => ListHospitalModel.fromJson(json.decode(str));
class ListHospitalModel {
  String? output;
  List<NearbyHospitalData>? data;
  String? reason;

  ListHospitalModel({this.output, this.data, this.reason});

  ListHospitalModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <NearbyHospitalData>[];
      json['data'].forEach((v) {
        data!.add(new NearbyHospitalData.fromJson(v));
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
