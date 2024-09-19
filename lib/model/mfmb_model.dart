import 'dart:convert';

MfmbModel mfmbModelFromJson(String str) => MfmbModel.fromJson(json.decode(str));
class MfmbModel {
  String? message;
  String? success;
  PayloadData? Payload;

  MfmbModel({this.message, this.success, this.Payload});

  factory MfmbModel.fromJson(Map<String, dynamic> json) {
    return MfmbModel(
      message: json['message'] as String?,
      success: json['success'] as String?,
      Payload: json['Payload'] != null
          ? PayloadData.fromJson(json['Payload'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'Payload': Payload?.toJson(),
    };
  }
}


PayloadData payloadDataFromJson(String str) => PayloadData.fromJson(json.decode(str));
class PayloadData {
  List<TableData>? Table;

  PayloadData({this.Table});

  PayloadData.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      Table = <TableData>[];
      json['Table'].forEach((v) {
        Table!.add(new TableData.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.Table != null) {
      data['Table'] = this.Table!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class TableData{
  String? VerifiedAreaInAcre;
  String? VerifiedCrop;
  String? VerifiedCommodityID;
  String? RegisteredArea;
  String? SownCrop;
  String? SownCommodityID;
  String? Khewat;
  String? Muraba;
  String? VIL_NAME;
  String? TEH_NAME;
  String? DIS_NAME;
  String? Vil_Code;
  String? Teh_Code;
  String? Dis_Code;
  String? FarmerID;

  TableData(
      this.VerifiedAreaInAcre,
      this.VerifiedCrop,
      this.VerifiedCommodityID,
      this.RegisteredArea,
      this.SownCrop,
      this.SownCommodityID,
      this.Khewat,
      this.Muraba,
      this.VIL_NAME,
      this.TEH_NAME,
      this.DIS_NAME,
      this.Vil_Code,
      this.Teh_Code,
      this.Dis_Code,
      this.FarmerID);

  TableData.fromJson(Map<String, dynamic> json) {
    VerifiedAreaInAcre = json['VerifiedAreaInAcre'];
    VerifiedCrop = json['VerifiedCrop'];
    VerifiedCommodityID = json['VerifiedCommodityID'];
    RegisteredArea = json['RegisteredArea'];
    SownCrop = json['SownCrop'];
    SownCommodityID = json['SownCommodityID'];
    Khewat = json['Khewat'];
    Muraba = json['Muraba'];
    VIL_NAME = json['VIL_NAME'];
    TEH_NAME = json['TEH_NAME'];
    DIS_NAME = json['DIS_NAME'];
    Vil_Code = json['Vil_Code'];
    Teh_Code = json['Teh_Code'];
    Dis_Code = json['Dis_Code'];
    FarmerID = json['FarmerID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VerifiedAreaInAcre'] = this.VerifiedAreaInAcre;
    data['VerifiedCrop'] = this.VerifiedCrop;
    data['VerifiedCommodityID'] = this.VerifiedCommodityID;
    data['RegisteredArea'] = this.RegisteredArea;
    data['SownCrop'] = this.SownCrop;
    data['SownCommodityID'] = this.SownCommodityID;
    data['Khewat'] = this.Khewat;
    data['Muraba'] = this.Muraba;
    data['VIL_NAME'] = this.VIL_NAME;
    data['TEH_NAME'] = this.TEH_NAME;
    data['DIS_NAME'] = this.DIS_NAME;
    data['Vil_Code'] = this.Vil_Code;
    data['Teh_Code'] = this.Teh_Code;
    data['Dis_Code'] = this.Dis_Code;
    data['FarmerID'] = this.FarmerID;
    return data;
  }
}

