import 'dart:convert';

SubServiceModel subServiceModelFromJson(String str) => SubServiceModel.fromJson(json.decode(str));
class SubServiceModel {
  String? output;
  List<Data>? data;
  String? reason;

  SubServiceModel({this.output, this.data, this.reason});

  SubServiceModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? categoryId;
  String? eSerName;
  String? hSerName;
  String? serviceLogo;
  int? deptId;
  String? applicationCode;
  String? serviceCode;
  String? schemeService;
  String? isSaralService;
  String? saralServiceID;
  String? availableOnSaral;
  String? headerparameter1;
  String? headerparameter2;
  String? webURL;
  int? redirect;
  int? isActive;

  Data(
      {this.id,
        this.categoryId,
        this.eSerName,
        this.hSerName,
        this.serviceLogo,
        this.deptId,
        this.applicationCode,
        this.serviceCode,
        this.schemeService,
        this.isSaralService,
        this.saralServiceID,
        this.availableOnSaral,
        this.headerparameter1,
        this.headerparameter2,
        this.webURL,
        this.redirect,
        this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['CategoryId'];
    eSerName = json['E_SerName'];
    hSerName = json['H_SerName'];
    serviceLogo = json['Service_Logo'];
    deptId = json['DeptId'];
    applicationCode = json['ApplicationCode'];
    serviceCode = json['ServiceCode'];
    schemeService = json['Scheme_Service'];
    isSaralService = json['IsSaral_Service'];
    saralServiceID = json['SaralServiceID'];
    availableOnSaral = json['AvailableOnSaral'];
    headerparameter1 = json['headerparameter1'];
    headerparameter2 = json['headerparameter2'];
    webURL = json['WebURL'];
    redirect = json['Redirect'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['CategoryId'] = this.categoryId;
    data['E_SerName'] = this.eSerName;
    data['H_SerName'] = this.hSerName;
    data['Service_Logo'] = this.serviceLogo;
    data['DeptId'] = this.deptId;
    data['ApplicationCode'] = this.applicationCode;
    data['ServiceCode'] = this.serviceCode;
    data['Scheme_Service'] = this.schemeService;
    data['IsSaral_Service'] = this.isSaralService;
    data['SaralServiceID'] = this.saralServiceID;
    data['AvailableOnSaral'] = this.availableOnSaral;
    data['headerparameter1'] = this.headerparameter1;
    data['headerparameter2'] = this.headerparameter2;
    data['WebURL'] = this.webURL;
    data['Redirect'] = this.redirect;
    data['IsActive'] = this.isActive;
    return data;
  }
}