// To parse this JSON data, do
//
//     final allTrainingListModel = allTrainingListModelFromJson(jsonString);

import 'dart:convert';

AllTrainingListModel allTrainingListModelFromJson(String str) => AllTrainingListModel.fromJson(json.decode(str));

String allTrainingListModelToJson(AllTrainingListModel data) => json.encode(data.toJson());

class AllTrainingListModel {
  List<AllTrainingList> data;

  AllTrainingListModel({
    required this.data,
  });

  factory AllTrainingListModel.fromJson(Map<String, dynamic> json) => AllTrainingListModel(
    data: List<AllTrainingList>.from(json["data"].map((x) => AllTrainingList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AllTrainingList {
  String reference;
  String status;
  String instituteName;
  String member;
  String courseOffered;
  dynamic courseRating;
  DateTime startDate;
  DateTime endDate;
  String memberEmail;
  String fullName;
  String mobileNumber;
  dynamic enrollRequest;

  AllTrainingList({
    required this.reference,
    required this.status,
    required this.instituteName,
    required this.member,
    required this.courseOffered,
    required this.courseRating,
    required this.startDate,
    required this.endDate,
    required this.memberEmail,
    required this.fullName,
    required this.mobileNumber,
    required this.enrollRequest,
  });

  factory AllTrainingList.fromJson(Map<String, dynamic> json) => AllTrainingList(
    reference: json["reference"] == null ? '': json["reference"],
    status: json["status"] == null ? '': json["status"],
    instituteName: json["institute_name"] == null ? '': json["institute_name"],
    member: json["member"] == null ? '': json["member"],
    courseOffered: json["course_offered"] == null ? '': json["course_offered"],
    courseRating: json["course_rating"] == null ? '': json["course_rating"],
    startDate: json["start_date"] == null ? DateTime.now() :DateTime.parse(json["start_date"]),
    endDate:  json["end_date"] == null ? DateTime.now() :DateTime.parse(json["end_date"]),
    memberEmail: json["member_email"] == null ? '': json["member_email"],
    fullName: json["full_name"] == null ? '': json["full_name"],
    mobileNumber: json["mobile_number"] == null ? '': json["mobile_number"],
    enrollRequest: json["enroll_request"] == null ? '': json["enroll_request"],
  );

  Map<String, dynamic> toJson() => {
    "reference": reference,
    "status": status,
    "institute_name": instituteName,
    "member": member,
    "course_offered": courseOffered,
    "course_rating": courseRating,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "member_email": memberEmail,
    "full_name": fullName,
    "mobile_number": mobileNumber,
    "enroll_request": enrollRequest,
  };
}
