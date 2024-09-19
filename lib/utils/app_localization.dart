import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:JanSahayak/jan_sahayak.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en_US': enUs,
      'hi_IN': hiIN,
    };
  }

  Map<String, String> enUs = {
    "JanSahayak": "Jan Sahayak",
    "government_of_haryana_n_welcomes_you":
        "Government of Haryana, \nWelcomes you!",
    "reg_text": "For registration/login please enter your familyid.",
    "enter_mobile_text": "Please enter your mobile number.",
    "mobile_number": "Mobile Number",
    "next": "Next",
    "verify_mobile": "Verify Mobile",
    "verify_otp": "Verify OTP",
    "otp_text": "Enter the code  sent to your number",
    "otp_number": "Mobile Number : ",
    "app_name": "Jan Sahayak",
    "name": "Name *",
    "enter_name": "Enter your full name",
    "district": "District ",
    "enter_district": "Enter District",
    "email": "Email",
    "enter_email": "Enter your Email Address",
    "dob": "Date of birth",
    "enter_dob": "Enter date of birth",
    "enter_otp": "Enter the code  sent to your number",
    "submit": "SUBMIT",
    "ambala": "Ambala",
    "bhiwani": "Bhiwani",
    "charkhi_dadri": "Charkhi Dadri",
    "faridabad": "Faridabad",
    "fatehabad": "Fatehabad",
    "gurugram": "Gurugram",
    "hisar": "Hisar",
    "jhajjar": "Jhajjar",
    "jind": "Jind",
    "kaithal": "Kaithal",
    "karnal": "Karnal",
    "kurukshetra": "Kurukshetra",
    "mahendragarh": "Mahendragarh",
    "nuh": "Nuh",
    "palwal": "Palwal",
    "panchkula": "Panchkula",
    "panipat": "Panipat",
    "rewari": "Rewari",
    "rohtak": "Rohtak",
    "sirsa": "Sirsa",
    "sonipat": "Sonipat",
    "yamunanagar": "Yamunanagar",
    "select_distric_hint": "Please select district",
    "resend_code": "Resend OTP",
    "male": "MALE",
    "female": "FEMALE",
    "other": "OTHER",
    "gender": "Gender",
    "app_about":
        "Jansahayak Help Me Mobile App is an initiative of Government of Haryana to provide a single point of interface to citizens for accessing all Government Services (G2C, G2B, G2E), Emergency Helplines and other information services over mobile platform. It is a bilingual mobile app in both English & Hindi.",
    "hello": "Hello ,",
    "share": "Share with your friends ",
    "settings": "Settings",
    "logout": "Logout",
    "parivar_pehchan_patra": "Parivar Pehchan Patra",
    "citizen_corner": "Citizen Corner",
    "department": "Departments",
    "downloaded_documents": "Downloaded Documents",
    "list_of_documents_downloaded_on_jansahayak":
        "List of documents downloaded on JanSahayak",
    "follow_us_to_stay_connected": "Follow us to stay connected",
    "saral_services": "Saral Services",
    "apply": "Apply",
    "deptt": "Deptt : ",
    "are_you_sure_you_want_to_sign_out": "Are you sure you want to Sign Out?",
    "verify_family_id": "Verify Family Id issued by Government of Haryana",
    "family_intro": "Please verify your family id to avail the benefits of Government services and schemes. Family ID identifies each and every family in Haryana and keeps the basic data of the family, provided with the consent of the family, in a digital format.",
    "family_know_more": "Click here to know more about Family Id.",
    "family_id_verification": "Family Id Verification",
    "access_these_services": "Need to verify family ID to access these services",
    "family_id_aadhar": "Please enter your Family ID*",
    "skip": "SKIP",
    "farmer_record": "Farmer Record - eKharid",
    "find_record": "Find Record",
    "commodity_name": "Commodity name",
    "produce_recived_date": "Produce Received Date",
    "commodity_variety_name": "Commodity Variety name",
    "quantity": "Quantity (in QTL.)",
    "farmer_id": "Farmer ID",
    "farmer_mobile": "Farmer Mobile",
    "farmer_name": "Farmer\'s Name",
    "farmer_personal_details": "Farmer\'s Personal Details",
    "farmer_s_id": "Farmer\'s ID",
    "account_no": "ACCOUNT NO",
    "mobile_no": "Mobile No",
    "ifsc_code": "IFSC CODE",
    "a_cupdated_on_mfmb": "A/CUPDATED ON MFMB",
    "father_name": "Father Name",
    "agency_name": "Agency Name",
    "mandi_name": "Mandi Name",
    "gatepass_id": "Gatepass ID",
    "gatepass_date": "Gatepass Date",
    "gatepass_lott_no": "Lott No.",
    "actual_weight_gatepass_weight_in_qtl": "Actual Weight/Gatepass Weight (in qtl.]",
    "devation_weight_in_qtl": "Deviation Weight (in qtl.]",
    "auction_recorder_id": "Auction Recorder ID",
    "auction_date": "Auction Date",
    "arthiya_firm_name": "Arthiya Firm Name",
    "iform_id": "IForm ID",
    "jform_id": "JForm ID",
    "ready_to_lift": "Ready to Lift",
    "ifted_date": "Lifted Date",
    "egatepass_id": "eGatepass ID",
    "egatepass_DT": "Generated Date Time",
    "dm_ms_apporval_date": "MSP Approval Date",
    "is_file_generated": "Is file Generated",
    "generated_date": "Generated Date",
    "total_amount": "Total Amount",
    "payable_amount": "Payable Amount",
    "generated_file_no": "File No.",
    "view_payment_details": "View Payment Details",
    "download_jform": "Download JFormं",




    "verify": "Verify",
    "resend_otp": "Resend OTP",
    "get_otp": "GET OTP",
    "please_enter_mobile_number": "Please enter Mobile Number",
    "enter_verification_code": "Enter Verification Code",
    "we_have_sent_code": "We have sent a code to +91",
    "cancel": "Cancel",
    "yes": "Yes",
    "total_application": "Total Application",
    "new_application": "New Application",
    "trial": "Trial",
    "without_trial": "Without Trial",
    "sine_die_application": "Sine Die Application",
    "rejected_application": "Rejected Application",
    "disposed_off_application": "Disposed Off Application",
    "pending_application": "Pending Application",
    "submitted_on": "Submitted On",
    "police_station": "Police Station",
    "fir_no_date": "FIR No. & Date",
    "applicant_name": "Applicant Name",
    "regn_number": "Regn. Number"
  };

  Map<String, String> hiIN = {
    "JanSahayak": "जन सहायक",
    "government_of_haryana_n_welcomes_you":
        "हरियाणा सरकार आपका स्वागत करती है!",
    "reg_text": "पंजीकरण/लॉगिन के लिए कृपया अपना परिवार आईडी दर्ज करें।",
    "enter_mobile_text":
        "पंजीकरण/लॉगिन के लिए कृपया अपना मोबाइल नंबर/परिवार आईडी दर्ज करें।",
    "next": "आगे बढ़ें",
    "verify_mobile": "मोबाइल सत्यापित करें",
    "verify_otp": "OTP सत्यापित करे",
    "otp_text": "अपने नंबर पर भेजे गए कोड को दर्ज करें!",
    "verify": "सत्यापित करें",
    "resend_otp": "ओटीपी पुनः भेजें",
    "otp_number": "मोबाइल नंबर : ",
    "app_name": "जन सहायक",
    "name": "नाम *",
    "district": "जिला",
    "enter_district": "जिला दर्ज करें",
    "enter_email": "अपना ईमेल पता दर्ज करें",
    "dob": "जन्म की तारीख",
    "enter_dob": "जन्म तारीख दर्ज करें",
    "enter_name": "अपना पूरा नाम भरें",
    "enter_otp": "आपके नंबर पर भेजा गया कोड दर्ज करें",
    "submit": "सबमिट",
    "ambala": "अंबाला",
    "bhiwani": "भिवानी",
    "charkhi_dadri": "चरखी दादरी",
    "faridabad": "फरीदाबाद",
    "fatehabad": "फतेहाबाद",
    "gurugram": "गुरुग्राम",
    "hisar": "हिसार",
    "jhajjar": "झज्जर",
    "jind": "जींद",
    "kaithal": "कैथल",
    "karnal": "करनाल",
    "kurukshetra": "कुरुक्षेत्र",
    "mahendragarh": "महेंद्रगढ़",
    "nuh": "नूह",
    "palwal": "पलवल",
    "panchkula": "पंचकुला",
    "panipat": "पानीपत",
    "rewari": "रेवाड़ी",
    "rohtak": "रोहतक",
    "sirsa": "सिरसा",
    "sonipat": "सोनीपत",
    "yamunanagar": "यमुनानगर",
    "select_distric_hint": "कृपया जिले का चयन करें",
    "resend_code": "ओटीपी पुनः भेजें",
    "male": "पुरुष",
    "female": "महिला",
    "other": "अन्य",
    "gender": "लिंग",
    "app_about":
        "यह एप्लिकेशन हरियाणा सरकार की एक पहल है और केवल हरियाणा राज्य स्थानों में काम करती है। यह द्विभाषी मोबाइल ऐप नागरिकों और हरियाणा सरकार के बीच इंटरफ़ेस का एकल बिंदु है।",
    "hello": "नमस्ते ,",
    "share": "अपने दोस्तों के साथ साझा करें",
    "settings": "सेटिंग्सं",
    "logout": "लॉग आउट",
    "parivar_pehchan_patra": "परिवार पहचान पत्र",
    "citizen_corner": "सिटीजन कॉर्नर",
    "department": "विभागों की सूच",
    "downloaded_documents": "डाउनलोड किए गए दस्तावेज़",
    "list_of_documents_downloaded_on_jansahayak":
        "जनसहायक पर डाउनलोड किए गए दस्तावेज़ों की सूची",
    "follow_us_to_stay_connected": "जुड़े रहने के लिए हमें फॉलो करें",
    "saral_services": "सरल सेवाएँ",
    "apply": "आवेदन",
    "deptt": "विभाग : ",
    "are_you_sure_you_want_to_sign_out": "क्या आप लॉग आउट करना चाहते हैं?",
    "verify_family_id": "हरियाणा सरकार द्वारा जारी परिवार आई डी सत्यापित करें",
    "family_intro": "सरकारी सेवाओं और योजनाओं का लाभ उठाने के लिए कृपया फैमिली आईडी सत्यापित करें। फैमिली आईडी हरियाणा में प्रत्येक परिवार की पहचान करता है और परिवार के मूल डेटा को डिजिटल प्रारूप में परिवार की सहमति से प्रदान करता है।",
    "family_know_more": "फैमिली आईडी के बारे में अधिक जानने के लिए यहां क्लिक करें।",
    "family_id_verification": "परिवार आईडी सत्यापन",
    "access_these_services": "इन सेवाओं तक पहुंचने के लिए परिवार की आईडी को सत्यापित करने की आवश्यकता है ",
    "family_id_aadhar": "कृपया अपनी फैमिली आईडी / आधार कार्ड दर्ज करें*",
    "skip": "छोड़ें",
    "farmer_record": "किसान रिकॉर्ड - eKharid",
    "find_record": "रिकॉर्ड खोजें",
    "commodity_name": "फसल का नाम",
    "produce_recived_date": "उत्पादन प्राप्त तिथि",
    "commodity_variety_name": "कमोडिटी किस्म का नाम",
    "quantity": "उपज (क्यूटीएल में।)",
    "farmer_id": "किसान आईडी",
    "farmer_mobile": "किसान मोबाइल",
    "farmer_name": "किसान का नाम",
    "farmer_personal_details": "किसान का व्यक्तिगत विवरण",
    "farmer_s_id": "किसान आईडी",
    "account_no": "खाता नंबर",
    "account_status": "खाते की स्थिति",
    "mobile_no": "मोबाइल नंबर",
    "ifsc_code": "आईएफएससी कोड",
    "a_cupdated_on_mfmb": "ए/एमएफएमबी पर अद्यतन",
    "father_name": "पिता का नाम",
    "agency_name": "एजेंसी का नाम",
    "mandi_name": "मंडी का नाम",
    "gatepass_id": "गेटपास आईडी",
    "gatepass_date": "गेटपास तिथि",
    "gatepass_lott_no": "लॉट नंबर.",
    "actual_weight_gatepass_weight_in_qtl": "वास्तविक वजन/गेटपास वजन (क्यूटीएल में)",
    "devation_weight_in_qtl": "विचलन वजन (क्यूटीएल में।]",
    "auction_recorder_id": "नीलामी रिकॉर्डर आईडी",
    "auction_date": "नीलामी की तारीख",
    "arthiya_firm_name": "आर्थिया फर्म का नाम",
    "iform_id": "आईफॉर्म आईडी",
    "jform_id": "जेफॉर्म आईडी",
    "ready_to_lift": "उठाने के लिए तैयार",
    "ifted_date": "दिनांक को उठा लिया गया",
    "egatepass_id": "ई-गेटपास आईडी",
    "egatepass_DT": "उत्पन्न दिनांक समय",
    "dm_ms_apporval_date": "एमएसपी अनुमोदन तिथि",
    "is_file_generated": "क्या फ़ाइल जेनरेट की गई है?",
    "generated_date": "उत्पन्न तिथि",
    "total_amount": "कुल राशि",
    "payable_amount": "भुगतान योग्य राशि",
    "generated_file_no": "दस्तावेज संख्या",
    "view_payment_details": "भुगतान विवरण देखें",
    "download_jform": "जेफॉर्म डाउनलोड करें",




    "mobile_number": "Mobile Number",
    "get_otp": "GET OTP",
    "please_enter_mobile_number": "Please enter Mobile Number",
    "enter_verification_code": "Enter Verification Code",
    "we_have_sent_code": "We have sent a code to +91",
    "cancel": "Cancel",
    "yes": "Yes",
    "total_application": "Total Application",
    "new_application": "New Application",
    "trial": "Trial",
    "without_trial": "Without Trial",
    "sine_die_application": "Sine Die Application",
    "rejected_application": "Rejected Application",
    "disposed_off_application": "Disposed Off Application",
    "pending_application": "Pending Application",
    "submitted_on": "Submitted On",
    "police_station": "Police Station",
    "fir_no_date": "FIR No. & Date",
    "applicant_name": "Applicant Name",
  };
}