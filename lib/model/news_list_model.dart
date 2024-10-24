import 'dart:convert';

NewsListModel newsListModelFromJson(String str) => NewsListModel.fromJson(json.decode(str));


class NewsListModel {
  int? staus;
  String? message;
  List<NewsListData>? data;

  NewsListModel({this.staus, this.message, this.data});

  NewsListModel.fromJson(Map<String, dynamic> json) {
    staus = json['staus'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NewsListData>[];
      json['data'].forEach((v) {
        data!.add(new NewsListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staus'] = this.staus;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsListData {
  String? nid;
  String? vid;
  String? title;

  NewsListData({this.nid, this.vid, this.title});

  NewsListData.fromJson(Map<String, dynamic> json) {
    nid = json['nid'];
    vid = json['vid'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nid'] = this.nid;
    data['vid'] = this.vid;
    data['title'] = this.title;
    return data;
  }
}
