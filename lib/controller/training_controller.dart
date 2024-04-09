import 'dart:convert';

import 'package:get/get.dart';
import 'package:salorify/api_function.dart';
import 'package:salorify/controller/kyc_controller.dart';
import 'package:salorify/model/training_detail.dart';
import 'package:http/http.dart' as http;
import 'package:salorify/model/training_list.dart';
import 'package:salorify/model/user_data_model.dart';

class TrainingController extends GetxController{
  String api = '';
  final ApiFunction apiFunction  = Get.put(ApiFunction());
  var headers = {
    'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
    'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
  };

  Future<TrainingData> getTrainingDetail(courseNo)async{
    print(courseNo);
    String url = 'https://sailorfy.searchosis.com/api/resource/Institute Course?'
        'fields=["name","course_offered","course_status","course_rating","is_popular",'
        '"course_duration","course_cost","institute_id","institute_name",'
        '"course_description","course_location","course_attachment"]'
        '&limit=100&filters=[["name","=","$courseNo"]]&order_by=name%20desc';
    print(url);
    var response = await http.get(Uri.parse(url), headers: headers);
    if(response.statusCode == 200){
      TrainingDetail trainingDetail = TrainingDetail.fromJson(jsonDecode(response.body));
      TrainingData trainingData = trainingDetail.data;
      return trainingData;
    }else{
      throw response.reasonPhrase.toString();
    }
  }

  Future<List<TrainingList>> trainingList(status)async{
    if(status == 'History'){
      api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member'
          '?fields=["institute_id","institute_name","status","institute_name",'
          '"member","course_id","course_name","course_rating","start_date",'
          '"end_date","member_email","full_name","mobile_number"]'
          '&limit=100&order_by=name%20desc&filters=[["member","=","778675"],["status","=","Completed"]]';
      update();
    }else if(status == 'Open'){
      api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member'
          '?fields=["institute_id","institute_name","status","institute_name",'
          '"member","course_id","course_name","course_rating","start_date",'
          '"end_date","member_email","full_name","mobile_number"]'
          '&limit=100&order_by=name%20desc&filters=[["member","=","778675"],["status","=","Open"]]';
      update();

    }else if(status == 'Ongoing'){
      api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member'
          '?fields=["institute_id","institute_name","status","institute_name",'
          '"member","course_id","course_name","course_rating","start_date",'
          '"end_date","member_email","full_name","mobile_number"]'
          '&limit=100&order_by=name%20desc&filters=[["member","=","778675"],["status","=","Ongoing"]]';
      update();

    }else if(status == 'Open'){
      api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member'
          '?fields=["institute_id","institute_name","status","institute_name",'
          '"member","course_id","course_name","course_rating","start_date",'
          '"end_date","member_email","full_name","mobile_number"]'
          '&limit=100&order_by=name%20desc&filters=[["member","=","778675"],["status","=","Open"]]';
      update();

    }else if(status == 'Open'){
      api = 'https://sailorfy.searchosis.com/api/resource/Enroll Member'
          '?fields=["institute_id","institute_name","status","institute_name",'
          '"member","course_id","course_name","course_rating","start_date",'
          '"end_date","member_email","full_name","mobile_number"]'
          '&limit=100&order_by=name%20desc&filters=[["member","=","778675"],["status","=","Open"]]';
      update();

    }
    var headers = {
      'Authorization': 'Token 006676296815f35:ee861eab5787f8d',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var response = await apiFunction.getMethod(api, headers);
    if(response != null){
      TrainingListModel trainingListModel = TrainingListModel.fromJson(response);
      List<TrainingList> trainingList = trainingListModel.data;

      update();
      return trainingList;
    }else{
      throw [];
    }
  }
}