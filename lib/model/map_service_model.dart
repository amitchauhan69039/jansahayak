import 'dart:convert';

MapServiceModel mapServiceModelFromJson(String str) => MapServiceModel.fromJson(json.decode(str));
class MapServiceModel {
  String? ct;
  String? iv;
  String? s;

  MapServiceModel({this.ct, this.iv, this.s});

  MapServiceModel.fromJson(Map<String, dynamic> json) {
    ct = json['ct'];
    iv = json['iv'];
    s = json['s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ct'] = this.ct;
    data['iv'] = this.iv;
    data['s'] = this.s;
    return data;
  }
}


class EncryptRequestModel {
  String? ct;
  String? iv;
  String? s;
}