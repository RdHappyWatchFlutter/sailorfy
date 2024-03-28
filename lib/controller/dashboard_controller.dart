import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salorify/api_function.dart';
import 'package:salorify/model/active_training_list_model.dart';
import 'package:salorify/model/certificate_list_model.dart';
import 'package:salorify/model/top_employers_list_model.dart';
import 'package:salorify/model/training_list_data_model.dart';
import 'package:salorify/model/user_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class DashBoardController extends GetxController{
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
  Future<List<ActiveTrainingList>> getActiveTrainingList()async{

    String api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member?fields=["name","reference","institute_name","member","full_name","member_email","mobile_number","course_offered","course_rating","start_date","end_date"]&filters=[["member","=", "99999"]]&limit=100&order_by=name%20desc';/*    String api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member?fields='
        '["name","course_offered","course_rating","is_popular","course_duration",'
        '"cost","institute_name","description","location","course_attachment"]&limit=100&order_by=name%20desc'
        '&filters=[["is_popular", "=" , "1"]]';*/
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);
    if(response != null){
      ActiveTrainingListModel activeTrainingListModel = ActiveTrainingListModel.fromJson(response);
      List<ActiveTrainingList> activeTrainingList = activeTrainingListModel.data;

      update();
      return activeTrainingList;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<List<ActiveCertificateList>> getCertificateList()async{

    String api = 'https://sailorfy.searchosis.com/api/resource/Certification?fields='
        '["name","reference","certified_course","course_durauion","course_rating","certification_number",'
        '"member","full_name","member_email","mobile_number","certification_issued_date","certificate_pdf"]&'
        'filters=[["member","=", "99999"]]&limit=100&order_by=name%20desc';
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
        'fields=["*"]&filters=[["top_employeer","=", "1"]]&limit=100&order_by=name%20desc';
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);

    if(response != null){
      print(response);

      TopEmployersListModel topEmployersListModel = TopEmployersListModel.fromJson(response);
      print('object1');
      List<TopEmployersList> topEmployersList = topEmployersListModel.data;

      print(topEmployersList.length);
      update();
      return topEmployersList;
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
}