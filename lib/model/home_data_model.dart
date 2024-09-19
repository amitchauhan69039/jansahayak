
import 'dart:convert';

HomeDataModel homeDataModelFromJson(String str) => HomeDataModel.fromJson(json.decode(str));
class HomeDataModel {
  String? output;
  List<Data>? data;
  String? reason;

  HomeDataModel({this.output, this.data, this.reason});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
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
  List<OSub>? oSub;
  List<OCategory>? oCategory;
  List<Odt>? odt;
  String? id;
  String? menuName;
  String? url;
  String? redirect;

  Data(
      {this.oSub,
        this.oCategory,
        this.odt,
        this.id,
        this.menuName,
        this.url,
        this.redirect});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['OSub'] != null) {
      oSub = <OSub>[];
      json['OSub'].forEach((v) {
        oSub!.add(new OSub.fromJson(v));
      });
    }
    if (json['oCategory'] != null) {
      oCategory = <OCategory>[];
      json['oCategory'].forEach((v) {
        oCategory!.add(new OCategory.fromJson(v));
      });
    }
    if (json['odt'] != null) {
      odt = <Odt>[];
      json['odt'].forEach((v) {
        odt!.add(new Odt.fromJson(v));
      });
    }
    id = json['Id'];
    menuName = json['Menu_Name'];
    url = json['Url'];
    redirect = json['Redirect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.oSub != null) {
      data['OSub'] = this.oSub!.map((v) => v.toJson()).toList();
    }
    if (this.oCategory != null) {
      data['oCategory'] = this.oCategory!.map((v) => v.toJson()).toList();
    }
    if (this.odt != null) {
      data['odt'] = this.odt!.map((v) => v.toJson()).toList();
    }
    data['Id'] = this.id;
    data['Menu_Name'] = this.menuName;
    data['Url'] = this.url;
    data['Redirect'] = this.redirect;
    return data;
  }
}

class OSub {
  String? id;
  String? menuId;
  String? subMenu;
  String? url;
  String? redirect;
  String? imgUrl;

  OSub(
      {this.id,
        this.menuId,
        this.subMenu,
        this.url,
        this.redirect,
        this.imgUrl});

  OSub.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    menuId = json['MenuId'];
    subMenu = json['Sub_Menu'];
    url = json['Url'];
    redirect = json['Redirect'];
    imgUrl = json['Img_Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['MenuId'] = this.menuId;
    data['Sub_Menu'] = this.subMenu;
    data['Url'] = this.url;
    data['Redirect'] = this.redirect;
    data['Img_Url'] = this.imgUrl;
    return data;
  }
}

class OCategory {
  String? id;
  String? category;
  String? categoryHindi;
  String? imgUrl;
  String? redirect;

  OCategory(
      {this.id, this.category, this.categoryHindi, this.imgUrl, this.redirect});

  OCategory.fromJson(Map<String, dynamic> json) {
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

class Odt {
  int? id;
  String? department;
  String? hDepName;
  String? code;
  int? status;
  int? setOrder;
  String? deptLogo;
  String? deptcode;

  Odt(
      {this.id,
        this.department,
        this.hDepName,
        this.code,
        this.status,
        this.setOrder,
        this.deptLogo,
        this.deptcode});

  Odt.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    department = json['Department'];
    hDepName = json['H_DepName'];
    code = json['code'];
    status = json['status'];
    setOrder = json['SetOrder'];
    deptLogo = json['Dept_logo'];
    deptcode = json['deptcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Department'] = this.department;
    data['H_DepName'] = this.hDepName;
    data['code'] = this.code;
    data['status'] = this.status;
    data['SetOrder'] = this.setOrder;
    data['Dept_logo'] = this.deptLogo;
    data['deptcode'] = this.deptcode;
    return data;
  }
}