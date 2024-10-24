import 'dart:convert';

import 'package:JanSahayak/screens/home/controller/jansahayak.dart';

RashanCardModel rashanCardModelFromJson(String str) => RashanCardModel.fromJson(json.decode(str));
class RashanCardModel {
  String? hash;
  String? hoFName;
  String? wardVillage;
  String? block;
  String? district;
  String? cardType;
  String? fpsName;
  String? fpsId;
  String? pppFamilyId;
  String? srcNo;


  RashanCardModel(
      this.hash,
      this.hoFName,
      this.wardVillage,
      this.block,
      this.district,
      this.cardType,
      this.fpsName,
      this.fpsId,
      this.pppFamilyId,
      this.srcNo);


  RashanCardModel.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    hoFName = json['hoFName'];
    wardVillage = json['wardVillage'];
    block = json['block'];
    district = json['district'];
    cardType = json['cardType'];
    fpsName = json['fpsName'];
    fpsId = json['fpsId'];
    pppFamilyId = json['pppFamilyId'];
    srcNo = json['srcNo'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['hoFName'] = this.hoFName;
    data['wardVillage'] = this.wardVillage;
    data['block'] = this.block;
    data['district'] = this.district;
    data['cardType'] = this.cardType;
    data['fpsName'] = this.fpsName;
    data['fpsId'] = this.fpsId;
    data['pppFamilyId'] = this.pppFamilyId;
    data['srcNo'] = this.srcNo;
    return data;
  }
}


