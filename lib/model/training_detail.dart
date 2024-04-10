// To parse this JSON data, do
//
//     final trainingDetail = trainingDetailFromJson(jsonString);

import 'dart:convert';

TrainingDetail trainingDetailFromJson(String str) => TrainingDetail.fromJson(json.decode(str));

String trainingDetailToJson(TrainingDetail data) => json.encode(data.toJson());

class TrainingDetail {
  List<TrainingData> data;

  TrainingDetail({
    required this.data,
  });

  factory TrainingDetail.fromJson(Map<String, dynamic> json) => TrainingDetail(
    data: List<TrainingData>.from(json["data"].map((x) => TrainingData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TrainingData {
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

  TrainingData({
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

  factory TrainingData.fromJson(Map<String, dynamic> json) => TrainingData(
    name: json["name"] ?? '',
    courseOffered: json["course_offered"] ?? '',
    courseStatus: json["course_status"] ?? '',
    courseRating: json["course_rating"] ?? 0,
    isPopular: json["is_popular"] ?? '',
    courseDuration: json["course_duration"] ?? '',
    courseCost: json["course_cost"] ?? '',
    instituteId: json["institute_id"] ?? '',
    instituteName: json["institute_name"] ?? '',
    courseDescription: json["course_description"] ?? '',
    courseLocation: json["course_location"] ?? '',
    courseAttachment: json["course_attachment"] ?? '',
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
