import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:salorify/api_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_data_model.dart';
import '../widget/show_aler_box.dart';
import 'dashboard_controller.dart';

class KycController extends GetxController {
  final dashboardController = Get.find<DashBoardController>();
  final formPrimaryDetails = GlobalKey<FormState>();
  final formAddress = GlobalKey<FormState>();
  final passporFrom = GlobalKey<FormState>();
  final formSeamanBook = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController indosNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController currentRankController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController nearestAirportController = TextEditingController();
  TextEditingController cityOfBirthController = TextEditingController();
  TextEditingController stateOfBirthController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController noOfChildrenController = TextEditingController();
  TextEditingController completeHomeAddressController = TextEditingController();
  TextEditingController alternateEmailController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passportCountryOfIssueController =
  TextEditingController();
  TextEditingController seamanBookNoController = TextEditingController();
  TextEditingController seamanCountryOfIssue = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController passportDateOfIssue = TextEditingController();
  TextEditingController passportDateOfExpiry = TextEditingController();
  TextEditingController seamenDateOfIssue = TextEditingController();
  TextEditingController seamenDateOfExpiry = TextEditingController();
  List<UserData>? userDataList;
  String passportPic = '';
  String seamanPic = '';
  bool loadingPrimary = false;
  bool loadingAddress = false;
  bool loadingPassport = false;
  bool loadingSeaman = false;

  Future<List<UserData>> getUserDetails() async {
    try {
      final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      String mobileNum = sharedPreferences.getString("mobileNo").toString();
      List<UserData> userData =
      await dashboardController.getUserData(mobileNum);
      userDataList = userData;
      return updateAllFiled(userData);
    } catch (e) {
      print(e);
    }
    return [];
  }

  final ApiFunction apiFunction = Get.put(ApiFunction());

  Future<void> updateKyc(body, message, context) async {
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie':
      'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    String api =
        'https://sailorfy.searchosis.com/api/resource/Member/${userDataList?[0].name}';
    var response = await http.put(Uri.parse(api),
        body: jsonEncode(body), headers: headers);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      await getUserDetails();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertBox(
            title: 'Success',
            message: message,
            onClose: () {
              // Perform actions when the alert box is closed (if needed)
            },
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertBox(
            title: 'Error',
            message: 'Something went wrong.',
            onClose: () {
              // Perform actions when the alert box is closed (if needed)
            },
          );
        },
      );
    }
  }

  List<UserData> updateAllFiled(List<UserData> userData) {
    firstNameController.text = userData[0].firstName ?? "";
    middleNameController.text = userData[0].middleName ?? "";
    lastNameController.text = userData[0].lastName ?? "";
    indosNumberController.text = userData[0].indosNo;
    emailController.text = userData[0].emailId;
    mobileController.text = userData[0].mobileNumber;
    designationController.text = userData[0].designation ?? "";
    currentRankController.text = userData[0].currentRank ?? "";
    fullNameController.text = userData[0].fullName;
    nationalityController.text = userData[0].nationality ?? "";
    nearestAirportController.text = userData[0].nearestAirport ?? "";
    cityOfBirthController.text = userData[0].cityOfBirth ?? "";
    stateOfBirthController.text = userData[0].stateOfBirth ?? "";
    maritalStatusController.text = userData[0].maritalStatus ?? "";
    noOfChildrenController.text = userData[0].noOfChildren;
    completeHomeAddressController.text = userData[0].homeAddress;
    alternateEmailController.text = userData[0].alternateEmail;
    passportNumberController.text = userData[0].passportNumber.toString();
    passportCountryOfIssueController.text = userData[0].passportCountryOfIssue;
    seamanBookNoController.text = userData[0].seamanBookNo.toString();
    seamanCountryOfIssue.text = userData[0].seamanCountryOfIssue.toString();
    dob.text = userData[0].dob ?? '';
    passportDateOfIssue.text = userData[0].passportDateOfIssue;
    passportDateOfExpiry.text = userData[0].passportDateOfExpiry;
    seamenDateOfIssue.text = userData[0].seamanDateOfIssue;
    seamenDateOfExpiry.text = userData[0].seamanDateOfExpiry;
    return userData;
  }
}