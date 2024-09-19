import 'dart:convert';

JavaTokenModel javaTokenModelFromJson(String str) => JavaTokenModel.fromJson(json.decode(str));

class JavaTokenModel {
  String? enycValue;

  JavaTokenModel({this.enycValue});

  JavaTokenModel.fromJson(Map<String, dynamic> json) {
    enycValue = json['enycValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enycValue'] = this.enycValue;
    return data;
  }
}