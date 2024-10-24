import 'dart:convert';

PropertySvamitvaModel propertySvamitvaModelFromJson(String str) => PropertySvamitvaModel.fromJson(json.decode(str));
class PropertySvamitvaModel {
  String? message;
  bool? success;

  PropertySvamitvaModel({this.message, this.success});

  factory PropertySvamitvaModel.fromJson(Map<String, dynamic> json) {
    return PropertySvamitvaModel(
      message: json['message'] as String?,
      success: json['success'] as bool?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
    };
  }
}

