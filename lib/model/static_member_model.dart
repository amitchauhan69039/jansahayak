import 'dart:convert';
StaticMemberData staticMemberDataFromJson(String str) => StaticMemberData.fromJson(json.decode(str));

class StaticMemberData{
  List<StaticMemberModel>? data;


  StaticMemberData(this.data);

  StaticMemberData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StaticMemberModel>[];
      json['data'].forEach((v) {
        data!.add(new StaticMemberModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


StaticMemberModel staticMemberModelFromJson(String str) => StaticMemberModel.fromJson(json.decode(str));


class StaticMemberModel {
  String? memberID;
  String? memberName;
  String? id;
  String? pppid;
  String? gender;
  String? mobile;
  String? Address;
  String? DOB;

  StaticMemberModel({required this.memberID,required this.memberName,required this.id,required this.pppid
    ,required this.gender,required this.mobile,required this.Address,required this.DOB});


  StaticMemberModel.fromJson(Map<String, String> json) {
    memberID = json['memberID'];
    memberName = json['memberName'];
    id = json['id'];
    pppid = json['pppid'];
    gender = json['gender'];
    mobile = json['mobile'];
    Address = json['Address'];
    DOB = json['DOB'];

  }


  Map<String, dynamic> toJson() {
    return {
      'memberID': memberID,
      'memberName': memberName,
      'id': id,
      'pppid': pppid,
      'gender': gender,
      'mobile': mobile,
      'Address': Address,
      'DOB': DOB,
    };
  }




}




