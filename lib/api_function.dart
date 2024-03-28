import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiFunction extends GetxController{

  var headers = {
    'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image=; full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
  };
  Future<http.Response> postMethod(bodyParam, url,header)async{
    var response = await http.post(
        Uri.parse(url),
      body: bodyParam,
      headers: header
    ).timeout(Duration(minutes: 1));
    print(response.statusCode);
    if(response.statusCode == 200){
      update();
      return response;
    }else{
      throw response.reasonPhrase.toString();
    }
  }
  Future<dynamic> getMethod(url,getHeaders)async{
    var response = await http.get(
        Uri.parse(url),
      headers: getHeaders
    ).timeout(Duration(minutes: 1));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw response.reasonPhrase.toString();
    }
  }
}