
import 'dart:convert';

FarmerPaymentDetailModel farmerPaymentDetailModelFromJson(String str) => FarmerPaymentDetailModel.fromJson(json.decode(str));
class FarmerPaymentDetailModel {
  String? output;
  List<Data>? data;
  String? reason;

  FarmerPaymentDetailModel({this.output, this.data, this.reason});

  FarmerPaymentDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? Reason;
  String? PaymentStatus;
  String? TransactionDate;
  String? BankRefNo;
  String? BankName;
  String? JFormNetAmountPayable;
  String? JFormIncidentalCharges;
  String? JFormWeightDeviation;
  String? JFormActualWeight;
  int? JFormNoofbags;
  String? JFormCreatedDate;
  int? JFormID;


  Data(
      this.Reason,
      this.PaymentStatus,
      this.TransactionDate,
      this.BankRefNo,
      this.BankName,
      this.JFormNetAmountPayable,
      this.JFormIncidentalCharges,
      this.JFormWeightDeviation,
      this.JFormActualWeight,
      this.JFormNoofbags,
      this.JFormCreatedDate,
      this.JFormID);

  Data.fromJson(Map<String, dynamic> json) {
    Reason = json['Reason'];
    PaymentStatus = json['PaymentStatus'];
    TransactionDate = json['TransactionDate'];
    BankRefNo = json['BankRefNo'];
    BankName = json['BankName'];
    JFormNetAmountPayable = json['JFormNetAmountPayable'];
    JFormIncidentalCharges = json['JFormIncidentalCharges'];
    JFormWeightDeviation = json['JFormWeightDeviation'];
    JFormActualWeight = json['JFormActualWeight'];
    JFormNoofbags = json['JFormNoofbags'];
    JFormCreatedDate = json['JFormCreatedDate'];
    JFormID = json['JFormID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Reason'] = this.Reason;
    data['PaymentStatus'] = this.PaymentStatus;
    data['TransactionDate'] = this.TransactionDate;
    data['BankRefNo'] = this.BankRefNo;
    data['BankName'] = this.BankName;
    data['JFormNetAmountPayable'] = this.JFormNetAmountPayable;
    data['JFormIncidentalCharges'] = this.JFormIncidentalCharges;
    data['JFormWeightDeviation'] = this.JFormWeightDeviation;
    data['JFormActualWeight'] = this.JFormActualWeight;
    data['JFormNoofbags'] = this.JFormNoofbags;
    data['JFormCreatedDate'] = this.JFormCreatedDate;
    data['JFormID'] = this.JFormID;
    return data;
  }
}

