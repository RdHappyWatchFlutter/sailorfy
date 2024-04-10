// To parse this JSON data, do
//
//     final trainingListModel = trainingListModelFromJson(jsonString);

import 'dart:convert';

TrainingListModel trainingListModelFromJson(String str) => TrainingListModel.fromJson(json.decode(str));

String trainingListModelToJson(TrainingListModel data) => json.encode(data.toJson());

class TrainingListModel {
  List<TrainingList> data;

  TrainingListModel({
    required this.data,
  });

  factory TrainingListModel.fromJson(Map<String, dynamic> json) => TrainingListModel(
    data: List<TrainingList>.from(json["data"].map((x) => TrainingList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TrainingList {
  String instituteId;
  String instituteName;
  String status;
  String member;
  String courseId;
  String courseName;
  double courseRating;
  DateTime startDate;
  DateTime endDate;
  String memberEmail;
  String fullName;
  String mobileNumber;

  TrainingList({
    required this.instituteId,
    required this.instituteName,
    required this.status,
    required this.member,
    required this.courseId,
    required this.courseName,
    required this.courseRating,
    required this.startDate,
    required this.endDate,
    required this.memberEmail,
    required this.fullName,
    required this.mobileNumber,
  });

  factory TrainingList.fromJson(Map<String, dynamic> json) => TrainingList(
    instituteId: json["institute_id"] == null ? '' : json["institute_id"],
    instituteName: json["institute_name"] == null ? '' : json["institute_name"],
    status: json["status"] == null ? '' : json["status"],
    member: json["member"] == null ? '' : json["member"],
    courseId: json["course_id"] == null ? '' : json["course_id"],
    courseName: json["course_name"] == null ? '' : json["course_name"],
    courseRating: json["course_rating"] == null ? 0 : json["course_rating"]?.toDouble(),
    startDate:  json["start_date"] == null ? DateTime.now() : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? DateTime.now() : DateTime.parse(json["end_date"]),
    memberEmail: json["member_email"] == null ? '' : json["member_email"],
    fullName: json["full_name"] == null ? '' : json["full_name"],
    mobileNumber: json["mobile_number"] == null ? '' : json["mobile_number"],
  );

  Map<String, dynamic> toJson() => {
    "institute_id": instituteId,
    "institute_name": instituteName,
    "status": status,
    "member": member,
    "course_id": courseId,
    "course_name": courseName,
    "course_rating": courseRating,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "member_email": memberEmail,
    "full_name": fullName,
    "mobile_number": mobileNumber,
  };
}
