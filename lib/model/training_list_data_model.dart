// To parse this JSON data, do
//
//     final trainingListDataModel = trainingListDataModelFromJson(jsonString);

import 'dart:convert';

TrainingListDataModel trainingListDataModelFromJson(String str) => TrainingListDataModel.fromJson(json.decode(str));

String trainingListDataModelToJson(TrainingListDataModel data) => json.encode(data.toJson());

class TrainingListDataModel {
  List<TrainingList> data;

  TrainingListDataModel({
    required this.data,
  });

  factory TrainingListDataModel.fromJson(Map<String, dynamic> json) => TrainingListDataModel(
    data: List<TrainingList>.from(json["data"].map((x) => TrainingList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TrainingList {
  String name;
  String courseOffered;
  double? courseRating;
  int isPopular;
  String courseDuration;
  String? cost;
  String? instituteName;
  String? description;
  String? location;
  String? courseAttachment;

  TrainingList({
    required this.name,
    required this.courseOffered,
    required this.courseRating,
    required this.isPopular,
    required this.courseDuration,
    required this.cost,
    required this.instituteName,
    required this.description,
    required this.location,
    required this.courseAttachment,
  });

  factory TrainingList.fromJson(Map<String, dynamic> json) => TrainingList(
    name: json["name"],
    courseOffered: json["course_offered"],
    courseRating: json["course_rating"]?.toDouble(),
    isPopular: json["is_popular"],
    courseDuration: json["course_duration"],
    cost: json["cost"],
    instituteName: json["institute_name"],
    description: json["description"],
    location: json["location"],
    courseAttachment: json["course_attachment"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "course_offered": courseOffered,
    "course_rating": courseRating,
    "is_popular": isPopular,
    "course_duration": courseDuration,
    "cost": cost,
    "institute_name": instituteName,
    "description": description,
    "location": location,
    "course_attachment": courseAttachment,
  };
}
