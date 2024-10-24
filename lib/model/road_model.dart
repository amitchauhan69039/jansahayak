import 'dart:convert';

RoadModel roadModellFromJson(String str) => RoadModel.fromJson(json.decode(str));

class RoadModel {
  String? status;
  List<RoadsData>? roads;
  String? message;
  int? road_count;

  RoadModel({this.status, this.roads, this.message,this.road_count});

  RoadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['roads'] != null) {
      roads = <RoadsData>[];
      json['roads'].forEach((v) {
        roads!.add(new RoadsData.fromJson(v));
      });
    }
    message = json['message'];
    road_count = json['road_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.roads != null) {
      data['roads'] = this.roads!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['road_count'] = this.road_count;
    return data;
  }
}

class RoadsData {
  String? id;
  String? name;
  String? categ;
  String? dept;

  RoadsData( this.id, this.name,
      this.categ, this.dept,);

  RoadsData.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    categ = json['categ'];
    dept = json['dept'];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['categ'] = this.categ;
    data['dept'] = this.dept;

    return data;
  }
}
