import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salorify/api_function.dart';
import 'package:salorify/model/all_training_list_model.dart';
import 'package:salorify/model/certificate_list_model.dart';
import 'package:salorify/model/top_employers_list_model.dart';
import 'package:salorify/model/training_list_data_model.dart';
import 'package:salorify/model/user_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import '../model/active_training_list_model.dart';
import '../model/training_list.dart';

class DashBoardController extends GetxController{
  late TabController tabController;
  final ApiFunction apiFunction = Get.put(ApiFunction());
  bool loading = false;
  int currentIndex = 0;
  late File image;
  late Widget currentPage;
  List<Widget> pages = <Widget>[];
  void changeTab(int index)async {
    //debugPrint(index.toString());
    currentIndex = index;
    currentPage = pages[index];
    update();
  }
  Future<List<UserData>> getUserData(number)async{
    String api = 'https://sailorfy.searchosis.com/api/resource/Member?fields=["*"]&filters=[["mobile_number", "=" , "$number"]]';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);
/*{data: [{name: Employee0002, creation: 2024-02-29 18:16:15.213617, modified: 2024-03-21 12:44:09.922590,
modified_by: Administrator, owner: Administrator, docstatus: 0, idx: 0, _user_tags: null,
_comments: null, _assign: null, _liked_by: null, first_name: Ankit, middle_name: Singh,
 last_name: Chauhan, full_name: Ankit Singh Chauhan, email_id: ankit@gmail.com,
  phone_number: 9999823454, data_6: null, date_of_birth: 2000-01-24, country: India,
   state: Haryana, city: Gurugrame, full_address: Gurugrame, gender: Male, pincode: 123456,
    rpsl_no: 1234, pic: /files/inno.png, age: 20, top_employeer: 1}]}*/
    if(response['data'] != null ){

      UserDataModel userDataModel = UserDataModel.fromJson(response);
      update();
      return userDataModel.data;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<List<TrainingList>> getTrainingList()async{
    String api = 'https://sailorfy.searchosis.com/api/resource/Course Offered?fields='
        '["name","course_offered","course_rating","is_popular","course_duration",'
        '"cost","institute_name","description","location","course_attachment"]&limit=100&order_by=name%20desc';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);

    if(response != null){
      TrainingListDataModel trainingListDataModel = TrainingListDataModel.fromJson(response);
      List<TrainingList> trainingList = trainingListDataModel.data;
      update();
      return trainingList;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<List<TrainingList>> getPopularTrainingList()async{
    String api = 'https://sailorfy.searchosis.com/api/resource/Course Offered?fields='
        '["name","course_offered","course_rating","is_popular","course_duration",'
        '"cost","institute_name","description","location","course_attachment"]&limit=100&order_by=name%20desc'
        '&filters=[["is_popular", "=" , "1"]]';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);

    if(response != null){

      TrainingListDataModel trainingListDataModel = TrainingListDataModel.fromJson(response);
      List<TrainingList> trainingList = trainingListDataModel.data;
      update();
      return trainingList;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<List<ActiveCertificateList>> getCertificateList(number)async{

    String api = 'https://sailorfy.searchosis.com/api/resource/Certification?'
        'fields=["name","institute_id","institute_name","member","full_name",'
        '"member_email","mobile_number","course_id","course_name","course_rating",'
        '"course_durauion","certification_number","certificate_pdf",'
        '"certification_issued_date"]&limit=100&order_by=name%20desc'
        '&filters=[["mobile_number","=","$number"]]';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);

    if(response != null){
      CertificateListModel certificateListModel = CertificateListModel.fromJson(response);
      List<ActiveCertificateList> certificateList = certificateListModel.data;

      update();
      return certificateList;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<List<TopEmployersList>> getTopEmployersList()async{

    String api = 'https://sailorfy.searchosis.com/api/resource/Employeer?'
        'fields=["*"]&filters=[["top_employeer","=","1"]]';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);

    if(response != null){
      TopEmployersListModel topEmployersListModel = TopEmployersListModel.fromJson(response);
      List<TopEmployersList> topEmployersList = topEmployersListModel.data;

      update();
      return topEmployersList;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<List<AllTrainingList>> getAllTrainingList(number)async{

    String api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member'
        '?fields=["reference","status","institute_name","member","course_offered",'
        '"course_rating","start_date","end_date","member_email","full_name",'
        '"mobile_number","enroll_request"]&limit=100&order_by=name%20desc'
        '&filters=[["mobile_number","=","$number"]]';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);

    if(response != null){
      AllTrainingListModel allTrainingListModel = AllTrainingListModel.fromJson(response);
      List<AllTrainingList> allTrainingList = allTrainingListModel.data;
      update();
      return allTrainingList;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<List<AllTrainingList>> getOnGoingTrainingList(number)async{

    String api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member'
        '?fields=["reference","status","institute_name","member","course_offered",'
        '"course_rating","start_date","end_date","member_email","full_name",'
        '"mobile_number","enroll_request"]&limit=100&order_by=name%20desc'
        '&filters=[["mobile_number","=","$number"],["status","=","Ongoing"]]';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);

    if(response != null){
      AllTrainingListModel allTrainingListModel = AllTrainingListModel.fromJson(response);
      List<AllTrainingList> allTrainingList = allTrainingListModel.data;

      print(allTrainingList.length);
      update();
      return allTrainingList;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<List<AllTrainingList>> getHistoryTrainingList(number)async{

    String api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member'
        '?fields=["reference","status","institute_name","member","course_offered",'
        '"course_rating","start_date","end_date","member_email","full_name",'
        '"mobile_number","enroll_request"]&limit=100&order_by=name%20desc'
        '&filters=[["mobile_number","=","$number"],["status","=","Completed"]]';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);

    if(response != null){
      print(response);

      AllTrainingListModel allTrainingListModel = AllTrainingListModel.fromJson(response);
      print('object1');
      List<AllTrainingList> allTrainingList = allTrainingListModel.data;

      print(allTrainingList.length);
      update();
      return allTrainingList;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  String getDuration(startDate,endDate){
    Duration diff = (startDate).difference((endDate));
    int days = diff.inDays;
    int years = (days / 365).toInt();
    int months =  ((days - (years * 365)) / 30).toInt();
    int weeks = ((days - (years * 365 + months * 30)) / 7).toInt();
    return "$months months";
  }

  Future<String> getAttachment(BuildContext context, File file) async {
    return await uploadImage(file, context);
  }

  Future<String> getImage(BuildContext context, ImageSource source) async {
    try {
      File? file = await imageSourceType(source);
      if (file.path.isNotEmpty) {
        return await getAttachment(context, file);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No file selected'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to get image'),
      ));
    }
    return 'error';
  }


  Future<String> uploadImage(File file, context) async {
    String api = 'https://sailorfy.searchosis.com/api/method/uplodefile';

    setHeaders() => {
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*",
      "Authorization": "Token 006676296815f35:ee861eab5787f8d",
      "Content-Type": "multipart/form-data"
    };

    try {
      var bytes = await file.readAsBytes();
      String imagebASE64 = base64.encode(bytes);

      if (imagebASE64 == '') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Image Upload Failed')));
        return 'error';
      } else {
        Map<String, String> data = {
          'cmd': 'uploadfile',
          'filename': path.basename(file.path),
          'filedata': imagebASE64,
          'from_form': '1',
        };
        var url = Uri.parse(api);
        var request = http.MultipartRequest("POST", url);
        request.headers.addAll(setHeaders());
        request.fields.addAll(data);

        var res = await request.send();
        final response = await http.Response.fromStream(res);

        Map<String, dynamic> responseJson = jsonDecode(response.body);

        switch (response.statusCode) {
          case 200:
            return responseJson['message']['file_url'];
          case 409:
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Unexpected error')));
            return 'error';
          case 408:
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Request timed out')));
            return 'error';
          case 500:
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internal server error, Try after sometime')));
            return 'error';
          case 503:
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Unexpected error')));
            return 'error';
          default:
            var responseCode = response.statusCode;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Unknown error$responseCode')));
            return 'error';
        }
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Unexpected error')));
      return "error";
    }
  }


  Future<File> imageSourceType(ImageSource imageSource) async {
    try {
      XFile? imageTaken =
      await ImagePicker().pickImage(source: imageSource, imageQuality: 50);

      if (imageTaken != null) {
        image = File(imageTaken.path);
        return image;
      } else {
        image = File('');
        return image;
      }
    } catch (e) {
      image = File('');
      return image;
    }
  }
  Future enrollNow(
      String member,
      String courseId,
      String instituteId
      ) async {
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    Map<String, String> body = {
      'member': member,
      'institute_id': instituteId,
      'course_id': courseId
    };
    print(jsonEncode(body));
    var response = await http.post(
        Uri.parse('https://sailorfy.searchosis.com/api/resource/Enroll Request?fields=[*]'),
      body: jsonEncode(body),
      headers: headers
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    }else{
      throw response.reasonPhrase.toString();
    }
  }
}