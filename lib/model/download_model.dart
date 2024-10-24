import 'dart:convert';

DownloadModel downloadModelFromJson(String str) => DownloadModel.fromJson(json.decode(str));
class DownloadModel {
  String? output;
  List<DownloadModelData>? data;
  String? reason;

  DownloadModel({this.output, this.data, this.reason});

  DownloadModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <DownloadModelData>[];
      json['data'].forEach((v) {
        data!.add(new DownloadModelData.fromJson(v));
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

class DownloadModelData {
  int? id;
  String? downloadUrl;
  String? engTitle;
  String? hinTitle;
  String? engDescription;
  String? hinDescription;
  bool? status;
  String? downloadDt;
  String? imageUrl;

  DownloadModelData(
      {this.id,
        this.downloadUrl,
        this.engTitle,
        this.hinTitle,
        this.engDescription,
        this.hinDescription,
        this.status,
        this.downloadDt,
        this.imageUrl});

  DownloadModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    downloadUrl = json['download_url'];
    engTitle = json['Eng_title'];
    hinTitle = json['Hin_title'];
    engDescription = json['Eng_description'];
    hinDescription = json['Hin_description'];
    status = json['status'];
    downloadDt = json['download_dt'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['download_url'] = this.downloadUrl;
    data['Eng_title'] = this.engTitle;
    data['Hin_title'] = this.hinTitle;
    data['Eng_description'] = this.engDescription;
    data['Hin_description'] = this.hinDescription;
    data['status'] = this.status;
    data['download_dt'] = this.downloadDt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}