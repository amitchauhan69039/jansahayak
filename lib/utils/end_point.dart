class EndPoints {

  static const String URL_BASE = "http://jansahayak.haryana.gov.in:81/api/";
  static const String URL_BASE_SHAADI= "http://jansahayak.haryana.gov.in:8080";
  static const String URL_BASE_SARAL= "https://saralharyana.gov.in/";
  static const String URL_BASE_DPRO= "https://prharyana.gov.in/mobileapp/";
  static const String URL_BASE_SARAL_TOKEN_JAVA= "http://164.100.137.55:8080/saral/";
  static const String URL_BASE_SARAL_STAGGING= "https://saralharyana.gov.in/configure/";

  static const String URL_BASE_EK= "https://ekharid.haryana.gov.in/api/FarmerSearchAPI/";
  static const String URL_BASE_EK_S= "http://103.127.140.19:81/api/FarmerSearchAPI/";
//    static const final String URL_BASE_HARPATH = "https://164.100.148.99/finalharpathforprod/webservices/";
  static const String URL_BASE_HARPATH = "https://harpathharyana.gov.in/webservices/";
  static const baseUrl = 'http://10.88.240.7/';
  static const api = baseUrl + "dev/";


  //--------------------------------- endpoints ---------------------------------
  static const loginWithNumber = '${URL_BASE}Service/Check_UserExist/';
  static const loginWithFamilyID = '${URL_BASE}Service/GetMemberbasicdetailsfromFIDUID/';
  static const OTPRequestForMEMID = '${URL_BASE}Service/OTPRequestforMEMID/';
  static const VerifyOtp = '${URL_BASE}Service/GetMemberDetail/';
  static const VerifyOtp2 = '${URL_BASE}Service/Verify_PPPID_UserID_Code_Request/';
  static const VerifyOtpGuestUser = '${URL_BASE}Service/Verify_GuestUser_Request/';
  static const registerViaMobile = '${URL_BASE}Service/Insert_GuestUserInfo/';
  static const getHomeData = '${URL_BASE}Service/Main_MenuAPI';
  static const getServiceData = '${URL_BASE}Service/Get_MainScreenData';
  static const getSaralData = '${URL_BASE}Service/GetSaralServices';
  static const getDepartmentData = '${URL_BASE}Service/Get_CategoryWiseDepartmentList/';
  static const getSubServiceData = '${URL_BASE}Service/Get_CategoryWiseServices/';
  static const getSaralAuthData = '${URL_BASE_SARAL}authorisation';
  static const getTokenFromJava = '${URL_BASE_SARAL_TOKEN_JAVA}getUrl';
  static const getKMSYears = '${URL_BASE_EK}GetSessionMaster?SessionID=7';
  static const getFamilyRecords = '${URL_BASE_EK}GetFarmerDetailsByPPPID';
  static const getFarmerPaymentDetail = '${URL_BASE_EK}GetPaymentDetails';
  static const getMFMBCropData = '${URL_BASE}Service/MFMBCropData/';
  static const getMarriageCertificateJava = '${URL_BASE_EK}java/api/janSahayak/getMarriageData';
  static const getPIDData = '${URL_BASE}Service/ViewDoc/';
  static const getRationCardData = '${URL_BASE}Service/GetRationCardData/';
  static const getCastCiertificateData = '${URL_BASE}Service/GetCerDataRecievedFromSaral/';
  static const getALLHospitalBasedOnKM = '${URL_BASE}Service/GetALLHospitalBasedonKM/';
  static const getALLDistrict = '${URL_BASE}Service/GetALLDistrict';
  static const getALLSpecialities = '${URL_BASE}Service/GetALLSpecialities';
  static const getHospitalTypeMaster = '${URL_BASE}Service/GetHospitalTypeMaster';
  static const getALLHospitalBasedOnDistrictAndSpec = '${URL_BASE}Service/GetALLHospitalBasedonDistrictAndSpec/';
  static const getNewsDPRO = '${URL_BASE_DPRO}api.php';
  static const getNewsDetails = '${URL_BASE_DPRO}get_news_detail.php';
  static const submitRatings = '${URL_BASE}Service/Insert_Appfeedabck_Request/';
  static const getDownload = '${URL_BASE}Service/Download';
  static const getMapService = '${URL_BASE_HARPATH}mapService';
  static const getHarPathOTP = '${URL_BASE_HARPATH}getOTP';
  static const registerHarPathUser = '${URL_BASE_HARPATH}registerUser';
  static const getRoadAttributes = '${URL_BASE_HARPATH}getRoadAttributes';


  static const verifyOTP = '${api}api/validateotp';
  static const getApplications = '${api}record';
  static const getSingleApplication = '${api}record/getrecordbyid';


}

