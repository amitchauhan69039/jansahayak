import 'dart:convert';

NewsDetailsModel newsDetailsModelFromJson(String str) => NewsDetailsModel.fromJson(json.decode(str));
class NewsDetailsModel {
  int? staus;
  String? message;
  NewsDetailsData? data;

  NewsDetailsModel({this.staus, this.message, this.data});

  NewsDetailsModel.fromJson(Map<String, dynamic> json) {
    staus = json['staus'];
    message = json['message'];
    data = json['data'] != null ? new NewsDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staus'] = this.staus;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NewsDetailsData {
  String? nid;
  String? vid;
  String? title;
  String? bodyValue;

  NewsDetailsData({this.nid, this.vid, this.title, this.bodyValue});

  NewsDetailsData.fromJson(Map<String, dynamic> json) {
    nid = json['nid'];
    vid = json['vid'];
    title = json['title'];
    bodyValue = json['body_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nid'] = this.nid;
    data['vid'] = this.vid;
    data['title'] = this.title;
    data['body_value'] = this.bodyValue;
    return data;
  }
}