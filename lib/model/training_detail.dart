// To parse this JSON data, do
//
//     final trainingDetail = trainingDetailFromJson(jsonString);

import 'dart:convert';

TrainingDetail trainingDetailFromJson(String str) => TrainingDetail.fromJson(json.decode(str));

String trainingDetailToJson(TrainingDetail data) => json.encode(data.toJson());

class TrainingDetail {
  TrainingData data;

  TrainingDetail({
    required this.data,
  });

  factory TrainingDetail.fromJson(Map<String, dynamic> json) => TrainingDetail(
    data: TrainingData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class TrainingData {
  String name;
  String owner;
  DateTime creation;
  DateTime modified;
  String modifiedBy;
  int docstatus;
  int idx;
  String instituteId;
  String instituteName;
  String courseOffered;
  String courseStatus;
  String courseDescription;
  String courseDuration;
  int isPopular;
  String doctype;

  TrainingData({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.instituteId,
    required this.instituteName,
    required this.courseOffered,
    required this.courseStatus,
    required this.courseDescription,
    required this.courseDuration,
    required this.isPopular,
    required this.doctype,
  });

  factory TrainingData.fromJson(Map<String, dynamic> json) => TrainingData(
    name: json["name"] == null ? '' : json["name"],
    owner: json["owner"] == null ? '' : json["owner"],
    creation: json['creation'] == null ? DateTime.now() : DateTime.parse(json["creation"]),
    modified: json['modified'] == null ? DateTime.now() : DateTime.parse(json["modified"]),
    modifiedBy: json["modified_by"] == null ? '' : json["modified_by"],
    docstatus: json["docstatus"] == null ? 0 : json["docstatus"],
    idx: json["idx"] == null ? 0 : json["idx"],
    instituteId: json["institute_id"] == null ? '' : json["institute_id"],
    instituteName: json["institute_name"] == null ? '' : json["institute_name"],
    courseOffered: json["course_offered"] == null ? '' : json["course_offered"],
    courseStatus: json["course_status"] == null ? '' : json["course_status"],
    courseDescription: json["course_description"] == null ? '' : json["course_description"],
    courseDuration: json["course_duration"] == null ? '' :  json["course_duration"],
    isPopular: json["is_popular"] == null ? 0 : json["is_popular"],
    doctype: json["doctype"] == null ? '' : json["doctype"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "owner": owner,
    "creation": creation.toIso8601String(),
    "modified": modified.toIso8601String(),
    "modified_by": modifiedBy,
    "docstatus": docstatus,
    "idx": idx,
    "institute_id": instituteId,
    "institute_name": instituteName,
    "course_offered": courseOffered,
    "course_status": courseStatus,
    "course_description": courseDescription,
    "course_duration": courseDuration,
    "is_popular": isPopular,
    "doctype": doctype,
  };
}
