import 'dart:convert';

SubmitRatingModel submitRatingModelFromJson(String str) => SubmitRatingModel.fromJson(json.decode(str));

class SubmitRatingModel {
  String? output;
  String? data;
  String? reason;

  SubmitRatingModel({this.output, this.data, this.reason});

  SubmitRatingModel.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    data = json['data'] ;
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['output'] = this.output;
    data['data'] = this.data;
    data['reason'] = this.reason;
    return data;
  }
}
