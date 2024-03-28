// To parse this JSON data, do
//
//     final activeTrainingListModel = activeTrainingListModelFromJson(jsonString);

import 'dart:convert';

ActiveTrainingListModel activeTrainingListModelFromJson(String str) => ActiveTrainingListModel.fromJson(json.decode(str));

String activeTrainingListModelToJson(ActiveTrainingListModel data) => json.encode(data.toJson());

class ActiveTrainingListModel {
  List<ActiveTrainingList> data;

  ActiveTrainingListModel({
    required this.data,
  });

  factory ActiveTrainingListModel.fromJson(Map<String, dynamic> json) => ActiveTrainingListModel(
    data: List<ActiveTrainingList>.from(json["data"].map((x) => ActiveTrainingList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ActiveTrainingList {
  String name;
  String reference;
  String instituteName;
  String member;
  String fullName;
  String memberEmail;
  String mobileNumber;
  String courseOffered;
  dynamic courseRating;
  DateTime startDate;
  DateTime endDate;

  ActiveTrainingList({
    required this.name,
    required this.reference,
    required this.instituteName,
    required this.member,
    required this.fullName,
    required this.memberEmail,
    required this.mobileNumber,
    required this.courseOffered,
    required this.courseRating,
    required this.startDate,
    required this.endDate,
  });

  factory ActiveTrainingList.fromJson(Map<String, dynamic> json) => ActiveTrainingList(
    name: json["name"] == null ? '' : json["name"],
    reference: json["reference"] == null ? '' : json["reference"],
    instituteName: json["institute_name"] == null ? '' : json["institute_name"],
    member: json["member"] == null ? '' : json["member"],
    fullName: json["full_name"] == null ? '' : json["full_name"],
    memberEmail: json["member_email"] == null ? '' : json["member_email"],
    mobileNumber: json["mobile_number"] == null ? '' : json["mobile_number"],
    courseOffered: json["course_offered"] == null ? '' : json["course_offered"],
    courseRating: json["course_rating"] == null ? '' : json["course_rating"],
    startDate: json["start_date"] == null ? DateTime.now() : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? DateTime.now() : DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "reference": reference,
    "institute_name": instituteName,
    "member": member,
    "full_name": fullName,
    "member_email": memberEmail,
    "mobile_number": mobileNumber,
    "course_offered": courseOffered,
    "course_rating": courseRating,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
  };
}
