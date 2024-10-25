import 'dart:convert';

HarpathReportModel harpathReportModelFromJson(String str) => HarpathReportModel.fromJson(json.decode(str));

class HarpathReportModel {
  String? status;
  List<ComplaintsData>? complaints;
  String? Message;

  HarpathReportModel({this.status, this.complaints, this.Message});

  HarpathReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['complaints'] != null) {
      complaints = <ComplaintsData>[];
      json['complaints'].forEach((v) {
        complaints!.add(new ComplaintsData.fromJson(v));
      });
    }
    Message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.complaints != null) {
      data['complaints'] = this.complaints!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.Message;
    return data;
  }
}

class ComplaintsData {
  int? id;
  String? timestamp;
  String? feedback_type;
  String? feedback;
  int? status;
  String? reopen;
  String? complaint_photo;
  String? road_name;
  String? completed_photo;
  String? dept;
  String? engineer_name;
  String? status_date;
  String? status_message;
  String? action_detail;
  String? complaint_can_reopen;
  String? complaint_resolution_time;


  ComplaintsData(this.id, this.timestamp, this.feedback_type, this.feedback,
      this.status, this.reopen, this.complaint_photo, this.road_name,
      this.completed_photo, this.dept, this.engineer_name, this.status_date,
      this.status_message, this.action_detail, this.complaint_can_reopen,
      this.complaint_resolution_time);



  ComplaintsData.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    timestamp = json['timestamp'];
    feedback_type = json['feedback_type'];
    feedback = json['feedback'];
    status = json['status'];
    reopen = json['reopen'];
    complaint_photo = json['complaint_photo'];
    road_name = json['road_name'];
    completed_photo = json['completed_photo'];
    dept = json['dept'];
    engineer_name = json['engineer_name'];
    status_date = json['status_date'];
    status_message = json['status_message'];
    action_detail = json['action_detail'];
    complaint_can_reopen = json['complaint_can_reopen'];
    complaint_resolution_time = json['complaint_resolution_time'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['timestamp'] = this.timestamp;
    data['feedback_type'] = this.feedback_type;
    data['feedback'] = this.feedback;
    data['status'] = this.status;
    data['reopen'] = this.reopen;
    data['complaint_photo'] = this.complaint_photo;
    data['road_name'] = this.road_name;
    data['completed_photo'] = this.completed_photo;
    data['dept'] = this.dept;
    data['engineer_name'] = this.engineer_name;
    data['status_date'] = this.status_date;
    data['status_message'] = this.status_message;
    data['action_detail'] = this.action_detail;
    data['complaint_can_reopen'] = this.complaint_can_reopen;
    data['complaint_resolution_time'] = this.complaint_resolution_time;
    return data;
  }
}
