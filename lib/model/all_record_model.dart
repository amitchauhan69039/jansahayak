import 'dart:convert';

AllRecordModel allRecordModelFromJson(String str) => AllRecordModel.fromJson(json.decode(str));
class AllRecordModel {
  Result? result;
  String? status;
  String? message;

  AllRecordModel({this.result, this.status, this.message});

  AllRecordModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  String? familyId;
  String? familyHeadName;
  String? familyLocality;
  String? familyHouseNumber;
  String? familyStreetNumber;
  String? familyLandMark;
  String? familyPinCode;
  String? familyDcode;
  String? familyBtCode;
  String? familyWvCode;
  String? familyDcodeLGD;
  String? familyBtCodeLGD;
  String? familyWvCodeLGD;
  String? familyDName;
  String? familyBName;
  String? familyWName;
  String? familyIncome;
  String? documentUpload;
  List<PppMemberDetails>? pppMemberDetails;

  Result(
      {this.familyId,
        this.familyHeadName,
        this.familyLocality,
        this.familyHouseNumber,
        this.familyStreetNumber,
        this.familyLandMark,
        this.familyPinCode,
        this.familyDcode,
        this.familyBtCode,
        this.familyWvCode,
        this.familyDcodeLGD,
        this.familyBtCodeLGD,
        this.familyWvCodeLGD,
        this.familyDName,
        this.familyBName,
        this.familyWName,
        this.familyIncome,
        this.documentUpload,
        this.pppMemberDetails});

  Result.fromJson(Map<String, dynamic> json) {
    familyId = json['familyId'];
    familyHeadName = json['familyHeadName'];
    familyLocality = json['familyLocality'];
    familyHouseNumber = json['familyHouseNumber'];
    familyStreetNumber = json['familyStreetNumber'];
    familyLandMark = json['familyLandMark'];
    familyPinCode = json['familyPinCode'];
    familyDcode = json['familyDcode'];
    familyBtCode = json['familyBtCode'];
    familyWvCode = json['familyWvCode'];
    familyDcodeLGD = json['familyDcodeLGD'];
    familyBtCodeLGD = json['familyBtCodeLGD'];
    familyWvCodeLGD = json['familyWvCodeLGD'];
    familyDName = json['familyDName'];
    familyBName = json['familyBName'];
    familyWName = json['familyWName'];
    familyIncome = json['familyIncome'];
    documentUpload = json['documentUpload'];
    if (json['pppMemberDetails'] != null) {
      pppMemberDetails = <PppMemberDetails>[];
      json['pppMemberDetails'].forEach((v) {
        pppMemberDetails!.add(new PppMemberDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['familyId'] = this.familyId;
    data['familyHeadName'] = this.familyHeadName;
    data['familyLocality'] = this.familyLocality;
    data['familyHouseNumber'] = this.familyHouseNumber;
    data['familyStreetNumber'] = this.familyStreetNumber;
    data['familyLandMark'] = this.familyLandMark;
    data['familyPinCode'] = this.familyPinCode;
    data['familyDcode'] = this.familyDcode;
    data['familyBtCode'] = this.familyBtCode;
    data['familyWvCode'] = this.familyWvCode;
    data['familyDcodeLGD'] = this.familyDcodeLGD;
    data['familyBtCodeLGD'] = this.familyBtCodeLGD;
    data['familyWvCodeLGD'] = this.familyWvCodeLGD;
    data['familyDName'] = this.familyDName;
    data['familyBName'] = this.familyBName;
    data['familyWName'] = this.familyWName;
    data['familyIncome'] = this.familyIncome;
    data['documentUpload'] = this.documentUpload;
    if (this.pppMemberDetails != null) {
      data['pppMemberDetails'] =
          this.pppMemberDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PppMemberDetails {
  String? familyID;
  String? memberID;
  String? isHouseHoldOrMember;
  String? firstName;
  String? lastName;
  String? gender;
  String? fatherFirstName;
  String? fatherLastName;
  String? motherFirstName;
  String? motherLastName;
  String? maritalStatus;
  String? spouseFirstName;
  String? spouseLastName;
  String? aadhaarNo;
  String? dob;
  int? age;
  String? mobileNo;
  int? relationshipWithHHCodes;
  String? isDivyang;
  double? divyangPercentage;
  int? casteCategory;
  int? occupation;
  double? totalIncome;
  int? qualification;
  String? email;
  double? totallandholding;
  int? acresLandholding;
  int? kanalLandholding;
  int? marlaLandholding;
  String? incometaxpayee;
  String? hasPanCard;
  String? disabiltyType;
  String? bankAccountNumber;
  String? ifscCode;
  String? firstNameLL;
  String? lastNameLL;
  String? fatherFirstNameLL;
  String? fatherLastNameLL;
  String? motherFirstNameLL;
  String? motherLastNameLL;
  String? spouseFirstNameLL;
  String? spouseLastNameLL;
  String? voterIDNo;
  String? livingsinceyear;
  String? placeofBirthState;
  String? placeofBirthDistrict;
  String? placeofBirthBlockTown;
  String? placeofBirthWardVillage;
  String? govtEmployee;
  String? pan;
  String? bpl;
  String? bplCardNO;
  String? divyangCategory;
  String? divyangValidUpto;
  String? isDemoAuth;
  String? relationshipWithHHName;
  String? casteCategoryName;
  String? occupationName;
  String? qualificationName;
  String? isDOBVerified;
  String? isCasteVerified;
  String? isIncomeVerified;
  String? isResidenceVerified;
  String? isNameVerified;
  String? isFnameVerified;
  String? isMnameVerified;
  String? isSnameVerified;
  String? isGenderVerified;
  String? isMobileVerified;
  String? isPlaceOfBirthVerified;
  String? isMaritalStatusVerified;
  String? isRelationWithHeadVerified;
  String? isBankVerified;
  String? isVoterIDVerified;
  String? isPanVerified;
  String? isBPLVerified;
  String? isDivyangVerified;
  String? isEngagementVerified;
  String? isQualificationVerified;
  String? districtName;
  String? btName;
  String? wvName;
  String? fullName;
  String? fullNameLL;
  String? fatherFullName;
  String? fatherFullNameLL;
  String? motherFullName;
  String? motherFullNameLL;
  String? spouseFullName;
  String? spouseFullNameLL;

  PppMemberDetails(
      {this.familyID,
        this.memberID,
        this.isHouseHoldOrMember,
        this.firstName,
        this.lastName,
        this.gender,
        this.fatherFirstName,
        this.fatherLastName,
        this.motherFirstName,
        this.motherLastName,
        this.maritalStatus,
        this.spouseFirstName,
        this.spouseLastName,
        this.aadhaarNo,
        this.dob,
        this.age,
        this.mobileNo,
        this.relationshipWithHHCodes,
        this.isDivyang,
        this.divyangPercentage,
        this.casteCategory,
        this.occupation,
        this.totalIncome,
        this.qualification,
        this.email,
        this.totallandholding,
        this.acresLandholding,
        this.kanalLandholding,
        this.marlaLandholding,
        this.incometaxpayee,
        this.hasPanCard,
        this.disabiltyType,
        this.bankAccountNumber,
        this.ifscCode,
        this.firstNameLL,
        this.lastNameLL,
        this.fatherFirstNameLL,
        this.fatherLastNameLL,
        this.motherFirstNameLL,
        this.motherLastNameLL,
        this.spouseFirstNameLL,
        this.spouseLastNameLL,
        this.voterIDNo,
        this.livingsinceyear,
        this.placeofBirthState,
        this.placeofBirthDistrict,
        this.placeofBirthBlockTown,
        this.placeofBirthWardVillage,
        this.govtEmployee,
        this.pan,
        this.bpl,
        this.bplCardNO,
        this.divyangCategory,
        this.divyangValidUpto,
        this.isDemoAuth,
        this.relationshipWithHHName,
        this.casteCategoryName,
        this.occupationName,
        this.qualificationName,
        this.isDOBVerified,
        this.isCasteVerified,
        this.isIncomeVerified,
        this.isResidenceVerified,
        this.isNameVerified,
        this.isFnameVerified,
        this.isMnameVerified,
        this.isSnameVerified,
        this.isGenderVerified,
        this.isMobileVerified,
        this.isPlaceOfBirthVerified,
        this.isMaritalStatusVerified,
        this.isRelationWithHeadVerified,
        this.isBankVerified,
        this.isVoterIDVerified,
        this.isPanVerified,
        this.isBPLVerified,
        this.isDivyangVerified,
        this.isEngagementVerified,
        this.isQualificationVerified,
        this.districtName,
        this.btName,
        this.wvName,
        this.fullName,
        this.fullNameLL,
        this.fatherFullName,
        this.fatherFullNameLL,
        this.motherFullName,
        this.motherFullNameLL,
        this.spouseFullName,
        this.spouseFullNameLL});

  PppMemberDetails.fromJson(Map<String, dynamic> json) {
    familyID = json['familyID'];
    memberID = json['memberID'];
    isHouseHoldOrMember = json['isHouseHoldOrMember'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    fatherFirstName = json['fatherFirstName'];
    fatherLastName = json['fatherLastName'];
    motherFirstName = json['motherFirstName'];
    motherLastName = json['motherLastName'];
    maritalStatus = json['maritalStatus'];
    spouseFirstName = json['spouseFirstName'];
    spouseLastName = json['spouseLastName'];
    aadhaarNo = json['aadhaarNo'];
    dob = json['dob'];
    age = json['age'];
    mobileNo = json['mobileNo'];
    relationshipWithHHCodes = json['relationshipWithHH_codes'];
    isDivyang = json['isDivyang'];
    divyangPercentage = json['divyangPercentage'];
    casteCategory = json['casteCategory'];
    occupation = json['occupation'];
    totalIncome = json['totalIncome'];
    qualification = json['qualification'];
    email = json['email'];
    totallandholding = json['totallandholding'];
    acresLandholding = json['acres_landholding'];
    kanalLandholding = json['kanal_landholding'];
    marlaLandholding = json['marla_landholding'];
    incometaxpayee = json['incometaxpayee'];
    hasPanCard = json['hasPanCard'];
    disabiltyType = json['disabiltyType'];
    bankAccountNumber = json['bankAccountNumber'];
    ifscCode = json['ifscCode'];
    firstNameLL = json['firstNameLL'];
    lastNameLL = json['lastNameLL'];
    fatherFirstNameLL = json['fatherFirstNameLL'];
    fatherLastNameLL = json['fatherLastNameLL'];
    motherFirstNameLL = json['motherFirstNameLL'];
    motherLastNameLL = json['motherLastNameLL'];
    spouseFirstNameLL = json['spouseFirstNameLL'];
    spouseLastNameLL = json['spouseLastNameLL'];
    voterIDNo = json['voterIDNo'];
    livingsinceyear = json['livingsinceyear'];
    placeofBirthState = json['placeofBirthState'];
    placeofBirthDistrict = json['placeofBirthDistrict'];
    placeofBirthBlockTown = json['placeofBirthBlockTown'];
    placeofBirthWardVillage = json['placeofBirthWardVillage'];
    govtEmployee = json['govtEmployee'];
    pan = json['pan'];
    bpl = json['bpl'];
    bplCardNO = json['bplCardNO'];
    divyangCategory = json['divyangCategory'];
    divyangValidUpto = json['divyangValidUpto'];
    isDemoAuth = json['isDemoAuth'];
    relationshipWithHHName = json['relationshipWithHH_name'];
    casteCategoryName = json['casteCategoryName'];
    occupationName = json['occupationName'];
    qualificationName = json['qualificationName'];
    isDOBVerified = json['isDOBVerified'];
    isCasteVerified = json['isCasteVerified'];
    isIncomeVerified = json['isIncomeVerified'];
    isResidenceVerified = json['isResidenceVerified'];
    isNameVerified = json['isNameVerified'];
    isFnameVerified = json['isFnameVerified'];
    isMnameVerified = json['isMnameVerified'];
    isSnameVerified = json['isSnameVerified'];
    isGenderVerified = json['isGenderVerified'];
    isMobileVerified = json['isMobileVerified'];
    isPlaceOfBirthVerified = json['isPlaceOfBirthVerified'];
    isMaritalStatusVerified = json['isMaritalStatusVerified'];
    isRelationWithHeadVerified = json['isRelationWithHeadVerified'];
    isBankVerified = json['isBankVerified'];
    isVoterIDVerified = json['isVoterIDVerified'];
    isPanVerified = json['isPanVerified'];
    isBPLVerified = json['isBPLVerified'];
    isDivyangVerified = json['isDivyangVerified'];
    isEngagementVerified = json['isEngagementVerified'];
    isQualificationVerified = json['isQualificationVerified'];
    districtName = json['districtName'];
    btName = json['btName'];
    wvName = json['wvName'];
    fullName = json['fullName'];
    fullNameLL = json['fullNameLL'];
    fatherFullName = json['fatherFullName'];
    fatherFullNameLL = json['fatherFullNameLL'];
    motherFullName = json['motherFullName'];
    motherFullNameLL = json['motherFullNameLL'];
    spouseFullName = json['spouseFullName'];
    spouseFullNameLL = json['spouseFullNameLL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['familyID'] = this.familyID;
    data['memberID'] = this.memberID;
    data['isHouseHoldOrMember'] = this.isHouseHoldOrMember;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['fatherFirstName'] = this.fatherFirstName;
    data['fatherLastName'] = this.fatherLastName;
    data['motherFirstName'] = this.motherFirstName;
    data['motherLastName'] = this.motherLastName;
    data['maritalStatus'] = this.maritalStatus;
    data['spouseFirstName'] = this.spouseFirstName;
    data['spouseLastName'] = this.spouseLastName;
    data['aadhaarNo'] = this.aadhaarNo;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['mobileNo'] = this.mobileNo;
    data['relationshipWithHH_codes'] = this.relationshipWithHHCodes;
    data['isDivyang'] = this.isDivyang;
    data['divyangPercentage'] = this.divyangPercentage;
    data['casteCategory'] = this.casteCategory;
    data['occupation'] = this.occupation;
    data['totalIncome'] = this.totalIncome;
    data['qualification'] = this.qualification;
    data['email'] = this.email;
    data['totallandholding'] = this.totallandholding;
    data['acres_landholding'] = this.acresLandholding;
    data['kanal_landholding'] = this.kanalLandholding;
    data['marla_landholding'] = this.marlaLandholding;
    data['incometaxpayee'] = this.incometaxpayee;
    data['hasPanCard'] = this.hasPanCard;
    data['disabiltyType'] = this.disabiltyType;
    data['bankAccountNumber'] = this.bankAccountNumber;
    data['ifscCode'] = this.ifscCode;
    data['firstNameLL'] = this.firstNameLL;
    data['lastNameLL'] = this.lastNameLL;
    data['fatherFirstNameLL'] = this.fatherFirstNameLL;
    data['fatherLastNameLL'] = this.fatherLastNameLL;
    data['motherFirstNameLL'] = this.motherFirstNameLL;
    data['motherLastNameLL'] = this.motherLastNameLL;
    data['spouseFirstNameLL'] = this.spouseFirstNameLL;
    data['spouseLastNameLL'] = this.spouseLastNameLL;
    data['voterIDNo'] = this.voterIDNo;
    data['livingsinceyear'] = this.livingsinceyear;
    data['placeofBirthState'] = this.placeofBirthState;
    data['placeofBirthDistrict'] = this.placeofBirthDistrict;
    data['placeofBirthBlockTown'] = this.placeofBirthBlockTown;
    data['placeofBirthWardVillage'] = this.placeofBirthWardVillage;
    data['govtEmployee'] = this.govtEmployee;
    data['pan'] = this.pan;
    data['bpl'] = this.bpl;
    data['bplCardNO'] = this.bplCardNO;
    data['divyangCategory'] = this.divyangCategory;
    data['divyangValidUpto'] = this.divyangValidUpto;
    data['isDemoAuth'] = this.isDemoAuth;
    data['relationshipWithHH_name'] = this.relationshipWithHHName;
    data['casteCategoryName'] = this.casteCategoryName;
    data['occupationName'] = this.occupationName;
    data['qualificationName'] = this.qualificationName;
    data['isDOBVerified'] = this.isDOBVerified;
    data['isCasteVerified'] = this.isCasteVerified;
    data['isIncomeVerified'] = this.isIncomeVerified;
    data['isResidenceVerified'] = this.isResidenceVerified;
    data['isNameVerified'] = this.isNameVerified;
    data['isFnameVerified'] = this.isFnameVerified;
    data['isMnameVerified'] = this.isMnameVerified;
    data['isSnameVerified'] = this.isSnameVerified;
    data['isGenderVerified'] = this.isGenderVerified;
    data['isMobileVerified'] = this.isMobileVerified;
    data['isPlaceOfBirthVerified'] = this.isPlaceOfBirthVerified;
    data['isMaritalStatusVerified'] = this.isMaritalStatusVerified;
    data['isRelationWithHeadVerified'] = this.isRelationWithHeadVerified;
    data['isBankVerified'] = this.isBankVerified;
    data['isVoterIDVerified'] = this.isVoterIDVerified;
    data['isPanVerified'] = this.isPanVerified;
    data['isBPLVerified'] = this.isBPLVerified;
    data['isDivyangVerified'] = this.isDivyangVerified;
    data['isEngagementVerified'] = this.isEngagementVerified;
    data['isQualificationVerified'] = this.isQualificationVerified;
    data['districtName'] = this.districtName;
    data['btName'] = this.btName;
    data['wvName'] = this.wvName;
    data['fullName'] = this.fullName;
    data['fullNameLL'] = this.fullNameLL;
    data['fatherFullName'] = this.fatherFullName;
    data['fatherFullNameLL'] = this.fatherFullNameLL;
    data['motherFullName'] = this.motherFullName;
    data['motherFullNameLL'] = this.motherFullNameLL;
    data['spouseFullName'] = this.spouseFullName;
    data['spouseFullNameLL'] = this.spouseFullNameLL;
    return data;
  }
}

