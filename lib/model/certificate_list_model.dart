// To parse this JSON data, do
//
//     final certificateListModel = certificateListModelFromJson(jsonString);

import 'dart:convert';

CertificateListModel certificateListModelFromJson(String str) => CertificateListModel.fromJson(json.decode(str));

String certificateListModelToJson(CertificateListModel data) => json.encode(data.toJson());

class CertificateListModel {
  List<ActiveCertificateList> data;

  CertificateListModel({
    required this.data,
  });

  factory CertificateListModel.fromJson(Map<String, dynamic> json) => CertificateListModel(
    data: List<ActiveCertificateList>.from(json["data"].map((x) => ActiveCertificateList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ActiveCertificateList {
  String name;
  String instituteId;
  String instituteName;
  String member;
  String fullName;
  String memberEmail;
  String mobileNumber;
  String courseId;
  String courseName;
  dynamic courseRating;
  String courseDurauion;
  String certificationNumber;
  String certificatePdf;
  DateTime certificationIssuedDate;

  ActiveCertificateList({
    required this.name,
    required this.instituteId,
    required this.instituteName,
    required this.member,
    required this.fullName,
    required this.memberEmail,
    required this.mobileNumber,
    required this.courseId,
    required this.courseName,
    required this.courseRating,
    required this.courseDurauion,
    required this.certificationNumber,
    required this.certificatePdf,
    required this.certificationIssuedDate,
  });

  factory ActiveCertificateList.fromJson(Map<String, dynamic> json) => ActiveCertificateList(
    name: json["name"],
    instituteId: json["institute_id"],
    instituteName: json["institute_name"],
    member: json["member"],
    fullName: json["full_name"],
    memberEmail: json["member_email"],
    mobileNumber: json["mobile_number"],
    courseId: json["course_id"],
    courseName: json["course_name"],
    courseRating: json["course_rating"],
    courseDurauion: json["course_durauion"],
    certificationNumber: json["certification_number"],
    certificatePdf: json["certificate_pdf"],
    certificationIssuedDate: DateTime.parse(json["certification_issued_date"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "institute_id": instituteId,
    "institute_name": instituteName,
    "member": member,
    "full_name": fullName,
    "member_email": memberEmail,
    "mobile_number": mobileNumber,
    "course_id": courseId,
    "course_name": courseName,
    "course_rating": courseRating,
    "course_durauion": courseDurauion,
    "certification_number": certificationNumber,
    "certificate_pdf": certificatePdf,
    "certification_issued_date": "${certificationIssuedDate.year.toString().padLeft(4, '0')}-${certificationIssuedDate.month.toString().padLeft(2, '0')}-${certificationIssuedDate.day.toString().padLeft(2, '0')}",
  };
}
