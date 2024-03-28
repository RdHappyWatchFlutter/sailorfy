// To parse this JSON data, do
//
//     final topEmployersListModel = topEmployersListModelFromJson(jsonString);

import 'dart:convert';

TopEmployersListModel topEmployersListModelFromJson(String str) => TopEmployersListModel.fromJson(json.decode(str));

String topEmployersListModelToJson(TopEmployersListModel data) => json.encode(data.toJson());

class TopEmployersListModel {
  List<TopEmployersList> data;

  TopEmployersListModel({
    required this.data,
  });

  factory TopEmployersListModel.fromJson(Map<String, dynamic> json) => TopEmployersListModel(
    data: List<TopEmployersList>.from(json["data"].map((x) => TopEmployersList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TopEmployersList {
  String name;
  DateTime creation;
  DateTime modified;
  String modifiedBy;
  String owner;
  int docstatus;
  int idx;
  dynamic userTags;
  dynamic comments;
  dynamic assign;
  dynamic likedBy;
  String firstName;
  String middleName;
  String lastName;
  String fullName;
  String emailId;
  String phoneNumber;
  dynamic data6;
  DateTime dateOfBirth;
  String country;
  String state;
  String city;
  String fullAddress;
  String gender;
  String pincode;
  String rpslNo;
  String pic;
  int age;
  int topEmployeer;

  TopEmployersList({
    required this.name,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.owner,
    required this.docstatus,
    required this.idx,
    required this.userTags,
    required this.comments,
    required this.assign,
    required this.likedBy,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.emailId,
    required this.phoneNumber,
    required this.data6,
    required this.dateOfBirth,
    required this.country,
    required this.state,
    required this.city,
    required this.fullAddress,
    required this.gender,
    required this.pincode,
    required this.rpslNo,
    required this.pic,
    required this.age,
    required this.topEmployeer,
  });

  factory TopEmployersList.fromJson(Map<String, dynamic> json) => TopEmployersList(
    name: json["name"],
    creation: DateTime.parse(json["creation"]),
    modified: DateTime.parse(json["modified"]),
    modifiedBy: json["modified_by"],
    owner: json["owner"],
    docstatus: json["docstatus"],
    idx: json["idx"],
    userTags: json["_user_tags"],
    comments: json["_comments"],
    assign: json["_assign"],
    likedBy: json["_liked_by"],
    firstName: json["first_name"],
    middleName: json["middle_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    emailId: json["email_id"],
    phoneNumber: json["phone_number"],
    data6: json["data_6"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    country: json["country"],
    state: json["state"],
    city: json["city"],
    fullAddress: json["full_address"],
    gender: json["gender"],
    pincode: json["pincode"],
    rpslNo: json["rpsl_no"],
    pic: json["pic"],
    age: json["age"],
    topEmployeer: json["top_employeer"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "creation": creation.toIso8601String(),
    "modified": modified.toIso8601String(),
    "modified_by": modifiedBy,
    "owner": owner,
    "docstatus": docstatus,
    "idx": idx,
    "_user_tags": userTags,
    "_comments": comments,
    "_assign": assign,
    "_liked_by": likedBy,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "full_name": fullName,
    "email_id": emailId,
    "phone_number": phoneNumber,
    "data_6": data6,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "country": country,
    "state": state,
    "city": city,
    "full_address": fullAddress,
    "gender": gender,
    "pincode": pincode,
    "rpsl_no": rpslNo,
    "pic": pic,
    "age": age,
    "top_employeer": topEmployeer,
  };
}
