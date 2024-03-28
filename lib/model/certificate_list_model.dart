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
  String reference;
  String certifiedCourse;
  String courseDurauion;
  double courseRating;
  String certificationNumber;
  String member;
  String fullName;
  String memberEmail;
  String mobileNumber;
  DateTime certificationIssuedDate;
  String certificatePdf;

  ActiveCertificateList({
    required this.name,
    required this.reference,
    required this.certifiedCourse,
    required this.courseDurauion,
    required this.courseRating,
    required this.certificationNumber,
    required this.member,
    required this.fullName,
    required this.memberEmail,
    required this.mobileNumber,
    required this.certificationIssuedDate,
    required this.certificatePdf,
  });

  factory ActiveCertificateList.fromJson(Map<String, dynamic> json) => ActiveCertificateList(
    name: json["name"],
    reference: json["reference"],
    certifiedCourse: json["certified_course"],
    courseDurauion: json["course_durauion"],
    courseRating: json["course_rating"]?.toDouble(),
    certificationNumber: json["certification_number"],
    member: json["member"],
    fullName: json["full_name"],
    memberEmail: json["member_email"],
    mobileNumber: json["mobile_number"],
    certificationIssuedDate: DateTime.parse(json["certification_issued_date"]),
    certificatePdf: json["certificate_pdf"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "reference": reference,
    "certified_course": certifiedCourse,
    "course_durauion": courseDurauion,
    "course_rating": courseRating,
    "certification_number": certificationNumber,
    "member": member,
    "full_name": fullName,
    "member_email": memberEmail,
    "mobile_number": mobileNumber,
    "certification_issued_date": "${certificationIssuedDate.year.toString().padLeft(4, '0')}-${certificationIssuedDate.month.toString().padLeft(2, '0')}-${certificationIssuedDate.day.toString().padLeft(2, '0')}",
    "certificate_pdf": certificatePdf,
  };
}
