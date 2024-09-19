import 'dart:convert';

ServiceDataModel serviceDataModelFromJson(String str) => ServiceDataModel.fromJson(json.decode(str));

class ServiceDataModel {
  String? output;
  ServiceData? data;
  String? reason;

  ServiceDataModel({this.output, this.data, this.reason});

  ServiceDataModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    data = json['data'] != null ? new ServiceData.fromJson(json['data']) : null;
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

class ServiceData {
  String? serviceCount;
  String? departmentCount;
  OCalendeModel? oCalendeModel;
  List<Categories>? oCategory;
  List<OEvents>? oEvents;
  List<OWhatsServiceList>? oWhatsServiceList;

  ServiceData(
      {this.serviceCount,
        this.departmentCount,
        this.oCalendeModel,
        this.oCategory,
        this.oEvents,
        this.oWhatsServiceList});

  ServiceData.fromJson(Map<String, dynamic> json) {
    serviceCount = json['ServiceCount'];
    departmentCount = json['DepartmentCount'];
    oCalendeModel = json['oCalendeModel'] != null
        ? new OCalendeModel.fromJson(json['oCalendeModel'])
        : null;
    if (json['oCategory'] != null) {
      oCategory = <Categories>[];
      json['oCategory'].forEach((v) {
        oCategory!.add(new Categories.fromJson(v));
      });
    }
    if (json['oEvents'] != null) {
      oEvents = <OEvents>[];
      json['oEvents'].forEach((v) {
        oEvents!.add(new OEvents.fromJson(v));
      });
    }
    if (json['oWhatsServiceList'] != null) {
      oWhatsServiceList = <OWhatsServiceList>[];
      json['oWhatsServiceList'].forEach((v) {
        oWhatsServiceList!.add(new OWhatsServiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceCount'] = this.serviceCount;
    data['DepartmentCount'] = this.departmentCount;
    if (this.oCalendeModel != null) {
      data['oCalendeModel'] = this.oCalendeModel!.toJson();
    }
    if (this.oCategory != null) {
      data['oCategory'] = this.oCategory!.map((v) => v.toJson()).toList();
    }
    if (this.oEvents != null) {
      data['oEvents'] = this.oEvents!.map((v) => v.toJson()).toList();
    }
    if (this.oWhatsServiceList != null) {
      data['oWhatsServiceList'] =
          this.oWhatsServiceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OCalendeModel {
  String? id;
  String? imgUrl;

  OCalendeModel({this.id, this.imgUrl});

  OCalendeModel.fromJson(Map<String, dynamic> json) {
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

class Categories {
  String? id;
  String? category;
  String? categoryHindi;
  String? imgUrl;
  String? redirect;

  Categories(
      {this.id, this.category, this.categoryHindi, this.imgUrl, this.redirect});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    category = json['Category'];
    categoryHindi = json['Category_hindi'];
    imgUrl = json['ImgUrl'];
    redirect = json['Redirect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Category'] = this.category;
    data['Category_hindi'] = this.categoryHindi;
    data['ImgUrl'] = this.imgUrl;
    data['Redirect'] = this.redirect;
    return data;
  }
}

class OEvents {
  String? id;
  String? eventTitleEnd;
  String? eventTitleHin;
  String? eventDescEng;
  String? eventDescHin;
  String? uploadImage;
  Null? eventType;
  Null? eventStartDate;
  Null? eventEndDate;

  OEvents(
      {this.id,
        this.eventTitleEnd,
        this.eventTitleHin,
        this.eventDescEng,
        this.eventDescHin,
        this.uploadImage,
        this.eventType,
        this.eventStartDate,
        this.eventEndDate});

  OEvents.fromJson(Map<String, dynamic> json) {
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

class OWhatsServiceList {
  int? id;
  String? eTitle;
  String? hTitle;
  String? eDescription;
  String? hDescription;
  String? linkUrl;
  String? image;
  String? imageName;
  String? datewu;
  int? status;
  int? showStatus;
  String? insertedDt;
  int? keyedby;

  OWhatsServiceList(
      {this.id,
        this.eTitle,
        this.hTitle,
        this.eDescription,
        this.hDescription,
        this.linkUrl,
        this.image,
        this.imageName,
        this.datewu,
        this.status,
        this.showStatus,
        this.insertedDt,
        this.keyedby});

  OWhatsServiceList.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    eTitle = json['E_title'];
    hTitle = json['H_title'];
    eDescription = json['E_description'];
    hDescription = json['H_description'];
    linkUrl = json['link_url'];
    image = json['image'];
    imageName = json['image_name'];
    datewu = json['datewu'];
    status = json['status'];
    showStatus = json['show_status'];
    insertedDt = json['inserted_dt'];
    keyedby = json['keyedby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['E_title'] = this.eTitle;
    data['H_title'] = this.hTitle;
    data['E_description'] = this.eDescription;
    data['H_description'] = this.hDescription;
    data['link_url'] = this.linkUrl;
    data['image'] = this.image;
    data['image_name'] = this.imageName;
    data['datewu'] = this.datewu;
    data['status'] = this.status;
    data['show_status'] = this.showStatus;
    data['inserted_dt'] = this.insertedDt;
    data['keyedby'] = this.keyedby;
    return data;
  }
}