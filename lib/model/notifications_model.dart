import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) => NotificationsModel.fromJson(json.decode(str));
class NotificationsModel {
  String? output;
  List<NotificationData>? data;
  String? reason;

  NotificationsModel({this.output, this.data, this.reason});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
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

class NotificationData {
  String? keyedby;
  String? keyedon;
  String? n_type;
  String? n_date;
  String? e_description;
  String? e_title;
  int? hid;
  int? id;


  NotificationData(this.keyedby, this.keyedon, this.n_type, this.n_date,
      this.e_description, this.e_title, this.hid, this.id);

  NotificationData.fromJson(Map<String, dynamic> json) {
    keyedby = json['keyedby'];
    keyedon = json['keyedon'];
    n_type = json['n_type'];
    n_date = json['n_date'];
    e_description = json['e_description'];
    e_title = json['e_title'];
    hid = json['hid'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyedby'] = this.keyedby;
    data['keyedon'] = this.keyedon;
    data['n_type'] = this.n_type;
    data['n_date'] = this.n_date;
    data['e_description'] = this.e_description;
    data['e_title'] = this.e_title;
    data['hid'] = this.hid;
    data['id'] = this.id;
    return data;
  }
}