import 'dart:convert';

HolidayEventModel holidayEventModelFromJson(String str) => HolidayEventModel.fromJson(json.decode(str));
class HolidayEventModel {
  String? output;
  HolidayEventData? data;
  String? reason;

  HolidayEventModel({this.output, this.data, this.reason});

  HolidayEventModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    data = json['data'] != null ? new HolidayEventData.fromJson(json['data']) : null;
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['output'] = this.output;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['reason'] = this.reason;
    return data;
  }
}

class HolidayEventData {
  List<OEventModel>? oEventModel;
  OCalenderModel? oCalenderModel;

  HolidayEventData({this.oEventModel, this.oCalenderModel});

  HolidayEventData.fromJson(Map<String, dynamic> json) {
    if (json['oEventModel'] != null) {
      oEventModel = <OEventModel>[];
      json['oEventModel'].forEach((v) {
        oEventModel!.add(new OEventModel.fromJson(v));
      });
    }
    oCalenderModel = json['oCalenderModel'] != null
        ? new OCalenderModel.fromJson(json['oCalenderModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.oEventModel != null) {
      data['oEventModel'] = this.oEventModel!.map((v) => v.toJson()).toList();
    }
    if (this.oCalenderModel != null) {
      data['oCalenderModel'] = this.oCalenderModel!.toJson();
    }
    return data;
  }
}

class OEventModel {
  String? id;
  String? eventTitleEnd;
  String? eventTitleHin;
  String? eventDescEng;
  String? eventDescHin;
  String? uploadImage;
  String? eventType;
  String? eventStartDate;
  String? eventEndDate;

  OEventModel(
      {this.id,
        this.eventTitleEnd,
        this.eventTitleHin,
        this.eventDescEng,
        this.eventDescHin,
        this.uploadImage,
        this.eventType,
        this.eventStartDate,
        this.eventEndDate});

  OEventModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    eventTitleEnd = json['event_title_end'];
    eventTitleHin = json['event_title_hin'];
    eventDescEng = json['event_desc_eng'];
    eventDescHin = json['event_desc_hin'];
    uploadImage = json['UploadImage'];
    eventType = json['event_type'];
    eventStartDate = json['event_start_date'];
    eventEndDate = json['event_end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['event_title_end'] = this.eventTitleEnd;
    data['event_title_hin'] = this.eventTitleHin;
    data['event_desc_eng'] = this.eventDescEng;
    data['event_desc_hin'] = this.eventDescHin;
    data['UploadImage'] = this.uploadImage;
    data['event_type'] = this.eventType;
    data['event_start_date'] = this.eventStartDate;
    data['event_end_date'] = this.eventEndDate;
    return data;
  }
}

class OCalenderModel {
  String? id;
  String? imgUrl;

  OCalenderModel({this.id, this.imgUrl});

  OCalenderModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    imgUrl = json['ImgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ImgUrl'] = this.imgUrl;
    return data;
  }
}