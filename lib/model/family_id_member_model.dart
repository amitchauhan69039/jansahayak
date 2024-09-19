import 'dart:convert';

FamilyIdMemberModel familyIdMemberModelFromJson(String str) => FamilyIdMemberModel.fromJson(json.decode(str));
class FamilyIdMemberModel {
  String? message;
  String? status;
  ResultEntity? result;

  FamilyIdMemberModel({this.message, this.status, this.result});

  factory FamilyIdMemberModel.fromJson(Map<String, dynamic> json) {
    return FamilyIdMemberModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
      result: json['result'] != null
          ? ResultEntity.fromJson(json['result'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'result': result?.toJson(),
    };
  }
}

class ResultEntity {
  String? fam;
  List<DropdownEntity>? dropdown;

  ResultEntity({this.fam, this.dropdown});

  factory ResultEntity.fromJson(Map<String, dynamic> json) {
    var dropdownList = json['dropdown'] as List?;
    List<DropdownEntity>? dropdownEntities = dropdownList
        ?.map((item) => DropdownEntity.fromJson(item))
        .toList();

    return ResultEntity(
      fam: json['fam'] as String?,
      dropdown: dropdownEntities,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fam': fam,
      'dropdown': dropdown?.map((item) => item.toJson()).toList(),
    };
  }
}

class DropdownEntity {
  String? text;
  String? value;

  DropdownEntity({this.text, this.value});

  factory DropdownEntity.fromJson(Map<String, dynamic> json) {
    return DropdownEntity(
      text: json['text'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'value': value,
    };
  }
}
