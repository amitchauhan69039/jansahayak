import 'dart:convert';

NearbyHospitalModel nearbyHospitalModelFromJson(String str) => NearbyHospitalModel.fromJson(json.decode(str));
class NearbyHospitalModel {
  String? output;
  List<NearbyHospitalData>? data;
  String? reason;

  NearbyHospitalModel({this.output, this.data, this.reason});

  NearbyHospitalModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['data'] != null) {
      data = <NearbyHospitalData>[];
      json['data'].forEach((v) {
        data!.add(new NearbyHospitalData.fromJson(v));
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

class NearbyHospitalData {
  List<OSpeciality>? oSpeciality;
  String? id;
  String? hID;
  String? hLAT;
  String? hLONG;
  String? hNAME;
  String? hDISTRICT;
  String? hCONTACT;
  String? hTYPE;
  String? hEMAIL;

  NearbyHospitalData(
      {this.oSpeciality,
        this.id,
        this.hID,
        this.hLAT,
        this.hLONG,
        this.hNAME,
        this.hDISTRICT,
        this.hCONTACT,
        this.hTYPE,
        this.hEMAIL});

  NearbyHospitalData.fromJson(Map<String, dynamic> json) {
    if (json['OSpeciality'] != null) {
      oSpeciality = <OSpeciality>[];
      json['OSpeciality'].forEach((v) {
        oSpeciality!.add(new OSpeciality.fromJson(v));
      });
    }
    id = json['Id'];
    hID = json['H_ID'];
    hLAT = json['H_LAT'];
    hLONG = json['H_LONG'];
    hNAME = json['H_NAME'];
    hDISTRICT = json['H_DISTRICT'];
    hCONTACT = json['H_CONTACT'];
    hTYPE = json['H_TYPE'];
    hEMAIL = json['H_EMAIL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.oSpeciality != null) {
      data['OSpeciality'] = this.oSpeciality!.map((v) => v.toJson()).toList();
    }
    data['Id'] = this.id;
    data['H_ID'] = this.hID;
    data['H_LAT'] = this.hLAT;
    data['H_LONG'] = this.hLONG;
    data['H_NAME'] = this.hNAME;
    data['H_DISTRICT'] = this.hDISTRICT;
    data['H_CONTACT'] = this.hCONTACT;
    data['H_TYPE'] = this.hTYPE;
    data['H_EMAIL'] = this.hEMAIL;
    return data;
  }
}

class OSpeciality {
  String? shortCode;
  String? sName;

  OSpeciality({this.shortCode, this.sName});

  OSpeciality.fromJson(Map<String, dynamic> json) {
    shortCode = json['Short_Code'];
    sName = json['S_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Short_Code'] = this.shortCode;
    data['S_Name'] = this.sName;
    return data;
  }
}