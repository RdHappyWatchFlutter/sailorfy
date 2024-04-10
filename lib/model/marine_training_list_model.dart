// To parse this JSON data, do
//
//     final MarineTrainingListModel = MarineTrainingListModelFromJson(jsonString);

import 'dart:convert';

MarineTrainingListModel MarineTrainingListModelFromJson(String str) => MarineTrainingListModel.fromJson(json.decode(str));

String MarineTrainingListModelToJson(MarineTrainingListModel data) => json.encode(data.toJson());

class MarineTrainingListModel {
  List<MarineTrainingList> data;

  MarineTrainingListModel({
    required this.data,
  });

  factory MarineTrainingListModel.fromJson(Map<String, dynamic> json) => MarineTrainingListModel(
    data: List<MarineTrainingList>.from(json["data"].map((x) => MarineTrainingList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MarineTrainingList {
  String name;
  String courseOffered;
  String courseStatus;
  dynamic courseRating;
  int isPopular;
  String courseDuration;
  dynamic courseCost;
  String instituteId;
  String instituteName;
  String courseDescription;
  dynamic courseLocation;
  dynamic courseAttachment;

  MarineTrainingList({
    required this.name,
    required this.courseOffered,
    required this.courseStatus,
    required this.courseRating,
    required this.isPopular,
    required this.courseDuration,
    required this.courseCost,
    required this.instituteId,
    required this.instituteName,
    required this.courseDescription,
    required this.courseLocation,
    required this.courseAttachment,
  });

  factory MarineTrainingList.fromJson(Map<String, dynamic> json) => MarineTrainingList(
    name: json["name"] == null ? '' : json["name"],
    courseOffered: json["course_offered"] == null ? '' : json["course_offered"],
    courseStatus: json["course_status"] == null ? '' : json["course_status"],
    courseRating: json["course_rating"] == null ? 0 : json["course_rating"],
    isPopular: json["is_popular"] == null ? '' : json["is_popular"],
    courseDuration: json["course_duration"] == null ? '' : json["course_duration"],
    courseCost: json["course_cost"] == null ? '' : json["course_cost"],
    instituteId: json["institute_id"] == null ? '' : json["institute_id"],
    instituteName: json["institute_name"] == null ? '' : json["institute_name"],
    courseDescription: json["course_description"] == null ? '' : json["course_description"],
    courseLocation: json["course_location"] == null ? '' : json["course_location"],
    courseAttachment: json["course_attachment"] == null ? '' : json["course_attachment"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "course_offered": courseOffered,
    "course_status": courseStatus,
    "course_rating": courseRating,
    "is_popular": isPopular,
    "course_duration": courseDuration,
    "course_cost": courseCost,
    "institute_id": instituteId,
    "institute_name": instituteName,
    "course_description": courseDescription,
    "course_location": courseLocation,
    "course_attachment": courseAttachment,
  };
}
