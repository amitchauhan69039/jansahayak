import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/verify_otp_model.dart';

import '../../../model/family_id_member_model.dart';

class AuthApi{

  static Future<LoginModel?> userLogin(String number) async {
    String url=EndPoints.loginWithNumber+number;
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
        url: url,
        isContentType: true,
        headers: headers
      );
      print("login: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          LoginModel model = loginModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  static Future<FamilyIdMemberModel?> userLoginWithFamilyId(String FamilyID) async {
    String url=EndPoints.loginWithFamilyID+FamilyID;
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers
      );
      print("login: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          FamilyIdMemberModel model = familyIdMemberModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  static Future<OtpRequestMemidModel?> otpRequestForMEMID(String Memberid,Map<String, dynamic>? queryParam) async {
    String url=EndPoints.OTPRequestForMEMID+Memberid;
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
        queryParams: queryParam
      );
      print("otp: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          OtpRequestMemidModel model = otpRequestMemidModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }


  static Future<VerifyOtpModel?> verifyOtp(String Memberid,Map<String, dynamic>? queryParam) async {
    String url=EndPoints.VerifyOtp+Memberid;
    Map<String,String> headers={"token":"token@123"};

    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
          queryParams: queryParam
      );
      print("otp: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          VerifyOtpModel model = verifyOtpModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  static Future<VerifyOtpModel?> verifyOtp2(String otp,Map<String, dynamic>? queryParam) async {
    String url=EndPoints.VerifyOtp2+otp;
    Map<String,String> headers={"token":"token@123"};

    try {
      final response = await HttpService.postApi2(
          url: url,
          isContentType: true,
          headers: headers,
          queryParams: queryParam
      );
      print("otp2: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          VerifyOtpModel model = verifyOtpModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  static Future<RegisterMobileModel?> registerViaMobileNumber(String mobileNumber,Map<String, dynamic>? queryParam) async {
    String url=EndPoints.registerViaMobile+mobileNumber;
    Map<String,String> headers={"token":"token@123"};

    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
          queryParams: queryParam
      );
      print("register: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          RegisterMobileModel model = registerMobileModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  static Future<RegisterMobileModel?> verifyOtpGuestUserRequest(String otp,Map<String, String>? queryParam) async {
    String url=EndPoints.VerifyOtpGuestUser+otp;
    Map<String,String> headers={"token":"token@123"};

    try {
      final response = await HttpService.postApi2(
          url: url,
          isContentType: true,
          headers: headers,
          queryParams: queryParam
      );
      print("otpGuestUser: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        print("statusCode:");
        final responseBody = response.body;
        try {
          print("try");
          RegisterMobileModel model = registerMobileModelFromJson(responseBody);
          return model;
        } catch (e) {
          print("eror : ${responseBody}");
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      print("eror 2: ${e.toString()}");
      throw Exception(e.toString());
    }
    return null;
  }
}
