import 'dart:convert';

FamilyRecordModel familyRecordModelFromJson(String str) => FamilyRecordModel.fromJson(json.decode(str));
class FamilyRecordModel {
  String? output;
  List<Data>? data;
  String? reason;

  FamilyRecordModel({this.output, this.data, this.reason});

  FamilyRecordModel.fromJson(Map<String, dynamic> json) {
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
  List<JFormDetails>? jFormDetails;
  List<GatePassDetails>? gatePassDetails;
  List<FarmerProduceDetails>? farmerProduceDetails;
  String? ekharidModifyDate;
  String? ekharidEntryDate;
  String? MFMBModifyDate;
  String? MFMBEntryDate;
  String? MemberID;
  String? FarmerPPPID;
  String? AccountStatus;
  String? FarmerIFSCCode;
  String? FarmerAccountNo;
  String? FarmerMobileNo;
  String? FarmerAadharNo;
  String? FarmerFatherName;
  String? FarmerName;
  String? FarmerID;
  String? DistrictName;


  Data(
      this.jFormDetails,
      this.gatePassDetails,
      this.farmerProduceDetails,
      this.ekharidModifyDate,
      this.ekharidEntryDate,
      this.MFMBModifyDate,
      this.MFMBEntryDate,
      this.MemberID,
      this.FarmerPPPID,
      this.AccountStatus,
      this.FarmerIFSCCode,
      this.FarmerAccountNo,
      this.FarmerMobileNo,
      this.FarmerAadharNo,
      this.FarmerFatherName,
      this.FarmerName,
      this.FarmerID,
      this.DistrictName);


  Data.fromJson(Map<String, dynamic> json) {
    ekharidModifyDate = json['ekharidModifyDate'];
    ekharidEntryDate = json['ekharidEntryDate'];
    MFMBModifyDate = json['MFMBModifyDate'];
    MFMBEntryDate = json['MFMBEntryDate'];
    MemberID = json['MemberID'];
    FarmerPPPID = json['FarmerPPPID'];
    AccountStatus = json['AccountStatus'];
    FarmerIFSCCode = json['FarmerIFSCCode'];
    FarmerAccountNo = json['FarmerAccountNo'];
    FarmerMobileNo = json['FarmerMobileNo'];
    FarmerAadharNo = json['FarmerAadharNo'];
    FarmerFatherName = json['FarmerFatherName'];
    FarmerName = json['FarmerName'];
    FarmerID = json['FarmerID'];
    DistrictName = json['DistrictName'];
    if (json['jFormDetails'] != null) {
      jFormDetails = <JFormDetails>[];
      json['jFormDetails'].forEach((v) {
        jFormDetails!.add(new JFormDetails.fromJson(v));
      });
    }

    if (json['gatePassDetails'] != null) {
      gatePassDetails = <GatePassDetails>[];
      json['gatePassDetails'].forEach((v) {
        gatePassDetails!.add(new GatePassDetails.fromJson(v));
      });
    }
    if (json['farmerProduceDetails'] != null) {
      farmerProduceDetails = <FarmerProduceDetails>[];
      json['farmerProduceDetails'].forEach((v) {
        farmerProduceDetails!.add(new FarmerProduceDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ekharidModifyDate'] = this.ekharidModifyDate;
    data['ekharidEntryDate'] = this.ekharidEntryDate;
    data['MFMBModifyDate'] = this.MFMBModifyDate;
    data['MFMBEntryDate'] = this.MFMBEntryDate;
    data['MemberID'] = this.MemberID;
    data['FarmerPPPID'] = this.FarmerPPPID;
    data['AccountStatus'] = this.AccountStatus;
    data['FarmerIFSCCode'] = this.FarmerIFSCCode;
    data['FarmerAccountNo'] = this.FarmerAccountNo;
    data['FarmerMobileNo'] = this.FarmerMobileNo;
    data['FarmerAadharNo'] = this.FarmerAadharNo;
    data['FarmerFatherName'] = this.FarmerFatherName;
    data['FarmerName'] = this.FarmerName;
    data['FarmerID'] = this.FarmerID;
    data['DistrictName'] = this.DistrictName;
    if (this.jFormDetails != null) {
      data['jFormDetails'] = this.jFormDetails!.map((v) => v.toJson()).toList();
    }
    if (this.gatePassDetails != null) {
      data['gatePassDetails'] = this.gatePassDetails!.map((v) => v.toJson()).toList();
    }
    if (this.farmerProduceDetails != null) {
      data['farmerProduceDetails'] = this.farmerProduceDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JFormDetails{
  String? JFormNetAmountPayable;
  String? JFormTotalAmount;
  String? FileGeneratedDate;
  String? IsFileGenerated;
  String? DMMSPApprovalDate;
  String? DMMSPApproval;
  String? InwardedJStatus;
  String? InwardedDateTime;
  String? eGatepassDate;
  int? eGatepassID;
  String? ReadyToLiftDate;
  String? ReadyToLift;
  int? JFormID;
  int? IFormID;

  JFormDetails(
      this.JFormNetAmountPayable,
      this.JFormTotalAmount,
      this.FileGeneratedDate,
      this.IsFileGenerated,
      this.DMMSPApprovalDate,
      this.DMMSPApproval,
      this.InwardedJStatus,
      this.InwardedDateTime,
      this.eGatepassDate,
      this.eGatepassID,
      this.ReadyToLiftDate,
      this.ReadyToLift,
      this.JFormID,
      this.IFormID);

  JFormDetails.fromJson(Map<String, dynamic> json) {
    JFormNetAmountPayable = json['JFormNetAmountPayable'];
    JFormTotalAmount = json['JFormTotalAmount'];
    FileGeneratedDate = json['FileGeneratedDate'];
    IsFileGenerated = json['IsFileGenerated'];
    DMMSPApprovalDate = json['DMMSPApprovalDate'];
    DMMSPApproval = json['DMMSPApproval'];
    InwardedJStatus = json['InwardedJStatus'];
    InwardedDateTime = json['InwardedDateTime'];
    eGatepassDate = json['eGatepassDate'];
    eGatepassID = json['eGatepassID'];
    ReadyToLiftDate = json['ReadyToLiftDate'];
    ReadyToLift = json['ReadyToLift'];
    JFormID = json['JFormID'];
    IFormID = json['IFormID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JFormNetAmountPayable'] = this.JFormNetAmountPayable;
    data['JFormTotalAmount'] = this.JFormTotalAmount;
    data['FileGeneratedDate'] = this.FileGeneratedDate;
    data['IsFileGenerated'] = this.IsFileGenerated;
    data['DMMSPApprovalDate'] = this.DMMSPApprovalDate;
    data['DMMSPApproval'] = this.DMMSPApproval;
    data['InwardedJStatus'] = this.InwardedJStatus;
    data['InwardedDateTime'] = this.InwardedDateTime;
    data['eGatepassDate'] = this.eGatepassDate;
    data['eGatepassID'] = this.eGatepassID;
    data['ReadyToLiftDate'] = this.ReadyToLiftDate;
    data['ReadyToLift'] = this.ReadyToLift;
    data['JFormID'] = this.JFormID;
    data['IFormID'] = this.IFormID;
    return data;
  }

}

class GatePassDetails{
  String? AartiyaFirmName;
  String? JFormDate;
  String? JFormID;
  String? AuctionDate;
  String? AuctionRecorderId;
  String? DevationWeight;
  String? GatePassWeight;
  String? ActualWeight;
  String? LotNumber;
  String? GatePassDate;
  String? GatePassId;
  String? MandiName;
  String? AgencyName;

  GatePassDetails(
      this.AartiyaFirmName,
      this.JFormDate,
      this.JFormID,
      this.AuctionDate,
      this.AuctionRecorderId,
      this.DevationWeight,
      this.GatePassWeight,
      this.ActualWeight,
      this.LotNumber,
      this.GatePassDate,
      this.GatePassId,
      this.MandiName,
      this.AgencyName);

  GatePassDetails.fromJson(Map<String, dynamic> json) {
    AartiyaFirmName = json['AartiyaFirmName'];
    JFormDate = json['JFormDate'];
    JFormID = json['JFormID'];
    AuctionDate = json['AuctionDate'];
    AuctionRecorderId = json['AuctionRecorderId'];
    DevationWeight = json['DevationWeight'];
    GatePassWeight = json['GatePassWeight'];
    ActualWeight = json['ActualWeight'];
    LotNumber = json['LotNumber'];
    GatePassDate = json['GatePassDate'];
    GatePassId = json['GatePassId'];
    MandiName = json['MandiName'];
    AgencyName = json['AgencyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AartiyaFirmName'] = this.AartiyaFirmName;
    data['JFormDate'] = this.JFormDate;
    data['JFormID'] = this.JFormID;
    data['AuctionDate'] = this.AuctionDate;
    data['AuctionRecorderId'] = this.AuctionRecorderId;
    data['DevationWeight'] = this.DevationWeight;
    data['GatePassWeight'] = this.GatePassWeight;
    data['ActualWeight'] = this.ActualWeight;
    data['LotNumber'] = this.LotNumber;
    data['GatePassDate'] = this.GatePassDate;
    data['GatePassId'] = this.GatePassId;
    data['MandiName'] = this.MandiName;
    data['AgencyName'] = this.AgencyName;
    return data;
  }
}

class FarmerProduceDetails{
  String? ProduceModifyDate;
  String? ProduceEntryDate;
  String? EstimatedProduce;
  String? CommodityVarietyName;
  String? CommodityName;

  FarmerProduceDetails(this.ProduceModifyDate, this.ProduceEntryDate,
      this.EstimatedProduce, this.CommodityVarietyName, this.CommodityName);

  FarmerProduceDetails.fromJson(Map<String, dynamic> json) {
    ProduceModifyDate = json['ProduceModifyDate'];
    ProduceEntryDate = json['ProduceEntryDate'];
    EstimatedProduce = json['EstimatedProduce'];
    CommodityVarietyName = json['CommodityVarietyName'];
    CommodityName = json['CommodityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProduceModifyDate'] = this.ProduceModifyDate;
    data['ProduceEntryDate'] = this.ProduceEntryDate;
    data['EstimatedProduce'] = this.EstimatedProduce;
    data['CommodityVarietyName'] = this.CommodityVarietyName;
    data['CommodityName'] = this.CommodityName;
    return data;
  }
}