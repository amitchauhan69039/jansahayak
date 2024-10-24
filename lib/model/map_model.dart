import 'dart:convert';

MapModel mapModelFromJson(String str) => MapModel.fromJson(json.decode(str));

class MapModel {
  String? status;
  List<MapData>? map;
  String? Message;

  MapModel({this.status, this.map, this.Message});

  MapModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['map'] != null) {
      map = <MapData>[];
      json['map'].forEach((v) {
        map!.add(new MapData.fromJson(v));
      });
    }
    Message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.map != null) {
      data['map'] = this.map!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.Message;
    return data;
  }
}

class MapData {
  String? roadlayers;
  String? mapservicesource;
  String? zoomlevel;
  String? para1;
  String? para2;
  String? para3;
  String? para4;
  String? para5;
  String? cameraDistance;
  String? android_ver;
  String? android_is_version_madt;
  String? android_update_msg;
  String? ios_ver;
  String? ios_is_version_madt;
  String? ios_update_msg;
  String? android_app_link;
  String? ios_app_link;


  MapData( this.roadlayers, this.mapservicesource, this.zoomlevel,
      this.para1, this.para2, this.para3, this.para4, this.para5,
      this.cameraDistance, this.android_ver, this.android_is_version_madt,
      this.android_update_msg, this.ios_ver, this.ios_is_version_madt,
      this.ios_update_msg, this.android_app_link, this.ios_app_link);

  MapData.fromJson(Map<String, dynamic> json) {

    roadlayers = json['roadlayers'];
    mapservicesource = json['mapservicesource'];
    zoomlevel = json['zoomlevel'];
    para1 = json['para1'];
    para2 = json['para2'];
    para3 = json['para3'];
    para4 = json['para4'];
    para5 = json['para5'];
    cameraDistance = json['cameraDistance'];
    android_ver = json['android_ver'];
    android_is_version_madt = json['android_is_version_madt'];
    android_update_msg = json['android_update_msg'];
    ios_ver = json['ios_ver'];
    ios_is_version_madt = json['ios_is_version_madt'];
    ios_update_msg = json['ios_update_msg'];
    android_app_link = json['android_app_link'];
    ios_app_link = json['ios_app_link'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['roadlayers'] = this.roadlayers;
    data['mapservicesource'] = this.mapservicesource;
    data['zoomlevel'] = this.zoomlevel;
    data['para1'] = this.para1;
    data['para2'] = this.para2;
    data['para3'] = this.para3;
    data['para4'] = this.para4;
    data['para5'] = this.para5;
    data['cameraDistance'] = this.cameraDistance;
    data['android_ver'] = this.android_ver;
    data['android_is_version_madt'] = this.android_is_version_madt;
    data['android_update_msg'] = this.android_update_msg;
    data['ios_ver'] = this.ios_ver;
    data['ios_is_version_madt'] = this.ios_is_version_madt;
    data['ios_update_msg'] = this.ios_update_msg;
    data['android_app_link'] = this.android_app_link;
    data['ios_app_link'] = this.ios_app_link;
    return data;
  }
}

class BasemapModel{

  String? streets;

  BasemapModel(this.streets);

  BasemapModel.fromJson(Map<String, dynamic> json) {
    streets = json['streets'];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['streets'] = this.streets;
    return data;
  }
}