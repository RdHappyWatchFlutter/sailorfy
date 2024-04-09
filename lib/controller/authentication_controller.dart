

import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:salorify/api_function.dart';
import 'package:http/http.dart' as http;
import 'package:salorify/model/login_model.dart';

class LoginController extends GetxController{
  TextEditingController phoneNumberController =  TextEditingController();
  TextEditingController fullNameController =  TextEditingController();
  TextEditingController indosNoController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController mobileController =  TextEditingController();
  TextEditingController designationController =  TextEditingController();
  late IntPhoneNumber intPhoneNumber;
  String otp = '';
  DateTime dob = DateTime.now();
  String enteredOtp = '';
  final ApiFunction apiFunction = Get.put(ApiFunction());

  Future<http.Response> signUp(fullName,email,indos, mobileNumber)async{
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Content-Type': 'application/json',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };

      String login =
          'https://sailorfy.searchosis.com/api/resource/Member?fields=["*"]';
      Map<String, String> body = {
        "full_name": fullName,
        "email_id": email,
        "mobile_number": mobileNumber,
        "indos_no": indos
      };
      var response = await apiFunction.postMethod(jsonEncode(body), login, headers);
        return response;
  }
  String? onValidate(value) {
    if(value.isEmpty || value.length<10 || value.length>10)
    {
      return 'Enter valid phone number';
    }
    return null;
  }
  String get6DigitNumber(){
    Random random = Random();
    String number = '';
    for(int i = 0; i < 6; i++){
      number = number + random.nextInt(9).toString();
    }
    return number;
  }

  Future<bool> checkUser(number) async {
    var api = 'https://sailorfy.searchosis.com/api/method/frappe.integrations.oauth2.get_token';
    Map<String, String> body = {
      'grant_type': 'password',
      'client_id': 'c2e39cbc23',
      'client_secret': '8e2dc80a6e',
      'username': number,
      'password': 'Sailorfy.member12@'
    };
    final response = await http.post(
        Uri.parse(api),
        headers: apiFunction.headers,
        body: body
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<LoginResponse> sendOtp(number, otp) async {
    var api = 'https://www.bulksmsplans.com/api/send_sms?'
        'api_id=APIW0ficnOV98358&api_password=Jansampark&sms_type=OTP&sms_encoding=text&sender='
        'SEARDM&number=$number&template_id=1707164448779465775&message=Your 51intl OTP is  $otp. It is valid for the next 10 minutes.SEARCHOSIS';
    setHeaders() => {
      'content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*",
    };
    final response = await http.post(
      Uri.parse(api),
      headers: setHeaders(),

    );
    if(response.statusCode == 200){
      LoginResponse loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      return loginResponse;
    }else{
      throw response.reasonPhrase.toString();
    }

  }
  disposeControllers(){
    phoneNumberController.clear();
    fullNameController.clear();
    indosNoController.clear();
    emailController.clear();
    mobileController.clear();
    designationController.clear();
  }
}
