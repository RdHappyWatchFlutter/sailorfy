// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  List<UserData> data;

  UserDataModel({
    required this.data,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    data:
    List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UserData {
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
  String seen;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  String fullName;
  String emailId;
  String indosNo;
  dynamic photo;
  dynamic view;
  dynamic data12;
  dynamic currentRank;
  dynamic dob;
  dynamic gender;
  dynamic nationality;
  dynamic cityOfBirth;
  dynamic stateOfBirth;
  dynamic maritalStatus;
  dynamic noOfChildren;
  dynamic homeAddress;
  String mobileNumber;
  dynamic nearestAirport;
  dynamic alternateEmail;
  dynamic passportNumber;
  dynamic dateOfIssue;
  dynamic dateOfExpiry;
  dynamic countryOfIssue;
  dynamic attachment;
  dynamic pic;
  dynamic seamanBookNo;
  dynamic dateOfIssue1;
  dynamic dateOfExpiry1;
  dynamic countryOfIssue1;
  dynamic attachment1;
  dynamic pic1;
  dynamic certificateOfCompetencyNo;
  dynamic dateOfIssue2;
  dynamic dateOfExpiry2;
  dynamic countryOfIssue2;
  dynamic attachment2;
  dynamic pic2;
  dynamic generalOperatorsCertificateNo;
  dynamic dateOfIssue3;
  dynamic dateOfExpiry3;
  dynamic countryOfIssue3;
  dynamic attachment3;
  dynamic flagStateEndorsementNo;
  dynamic dateOfIssue4;
  dynamic dateOfExpiry4;
  dynamic countryOfIssue4;
  dynamic attachment4;
  dynamic pic4;
  dynamic education;
  dynamic stcwTrainings;
  String trainingName;
  dynamic issuingCountry;
  dynamic number;
  dynamic issueDate;
  dynamic expiryDate;
  dynamic nameOfShip;
  dynamic typeOfShip;
  dynamic dwtFrom;
  dynamic dwtTo;
  int age;
  dynamic designation;
  dynamic passportCountryOfIssue;
  dynamic seamanCountryOfIssue;
  dynamic passportDateOfIssue;
  dynamic passportDateOfExpiry;
  dynamic seamanDateOfIssue;
  dynamic seamanDateOfExpiry;

  UserData({
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
    required this.seen,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.emailId,
    required this.indosNo,
    required this.photo,
    required this.view,
    required this.data12,
    required this.currentRank,
    required this.dob,
    required this.gender,
    required this.nationality,
    required this.cityOfBirth,
    required this.stateOfBirth,
    required this.maritalStatus,
    required this.noOfChildren,
    required this.homeAddress,
    required this.mobileNumber,
    required this.nearestAirport,
    required this.alternateEmail,
    required this.passportNumber,
    required this.dateOfIssue,
    required this.dateOfExpiry,
    required this.countryOfIssue,
    required this.attachment,
    required this.pic,
    required this.seamanBookNo,
    required this.dateOfIssue1,
    required this.dateOfExpiry1,
    required this.countryOfIssue1,
    required this.attachment1,
    required this.pic1,
    required this.certificateOfCompetencyNo,
    required this.dateOfIssue2,
    required this.dateOfExpiry2,
    required this.countryOfIssue2,
    required this.attachment2,
    required this.pic2,
    required this.generalOperatorsCertificateNo,
    required this.dateOfIssue3,
    required this.dateOfExpiry3,
    required this.countryOfIssue3,
    required this.attachment3,
    required this.flagStateEndorsementNo,
    required this.dateOfIssue4,
    required this.dateOfExpiry4,
    required this.countryOfIssue4,
    required this.attachment4,
    required this.pic4,
    required this.education,
    required this.stcwTrainings,
    required this.trainingName,
    required this.issuingCountry,
    required this.number,
    required this.issueDate,
    required this.expiryDate,
    required this.nameOfShip,
    required this.typeOfShip,
    required this.dwtFrom,
    required this.dwtTo,
    required this.age,
    required this.designation,
    required this.passportCountryOfIssue,
    required this.seamanCountryOfIssue,
    required this.passportDateOfIssue,
    required this.passportDateOfExpiry,
    required this.seamanDateOfIssue,
    required this.seamanDateOfExpiry,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    name: json["name"] ?? '',
    creation: json["creation"] == null
        ? DateTime.now()
        : DateTime.parse(json["creation"]),
    modified: json["modified"] == null
        ? DateTime.now()
        : DateTime.parse(json["modified"]),
    modifiedBy: json["modified_by"] ?? '',
    owner: json["owner"] ?? '',
    docstatus: json["docstatus"] ?? 0,
    idx: json["idx"] ?? 0,
    userTags: json["_user_tags"] ?? '',
    comments: json["_comments"] ?? '',
    assign: json["_assign"] ?? '',
    likedBy: json["_liked_by"] ?? '',
    seen: json["_seen"] ?? '',
    firstName: json["first_name"] ?? '',
    middleName: json["middle_name"] ?? '',
    lastName: json["last_name"] ?? '',
    fullName: json["full_name"] == null ? '' : json["full_name"],
    emailId: json["email_id"] == null ? '' : json["email_id"],
    indosNo: json["indos_no"] == null ? '' : json["indos_no"],
    photo: json["photo"] == null ? '' : json["photo"],
    view: json["view"] == null ? '' : json["view"],
    data12: json["data_12"] == null ? '' : json["data_12"],
    currentRank: json["current_rank"] == null ? '' : json["current_rank"],
    dob: json["dob"] == null ? '' : json["dob"],
    gender: json["gender"] == null ? '' : json["gender"],
    nationality: json["nationality"] == null ? '' : json["nationality"],
    cityOfBirth: json["city_of_birth"] ?? '',
    stateOfBirth: json["state_of_birth"] ?? '',
    maritalStatus: json["marital_status"] ?? '',
    noOfChildren: json["no_of_children"] ?? '',
    homeAddress: json["home_address"] ?? '',
    mobileNumber: json["mobile_number"] ?? '',
    nearestAirport: json["nearest_airport"] ?? '',
    alternateEmail: json["alternate_email"] ?? '',
    passportNumber: json["passport_number"] ?? '',
    dateOfIssue: json["date_of_issue"] ?? '',
    dateOfExpiry: json["date_of_expiry"] ?? '',
    countryOfIssue: json["country_of_issue"] ?? '',
    attachment: json["attachment"] ?? '',
    pic: json["pic"] ?? '',
    seamanBookNo: json["seaman_book_no"] ?? '',
    dateOfIssue1: json["date_of_issue_1"] ?? '',
    dateOfExpiry1: json["date_of_expiry_1"] ?? '',
    countryOfIssue1: json["country_of_issue_1"] ?? '',
    attachment1: json["attachment_1"] ?? '',
    pic1: json["pic_1"] ?? '',
    certificateOfCompetencyNo: json["certificate_of_competency_no"] ?? '',
    dateOfIssue2: json["date_of_issue_2"] ?? '',
    dateOfExpiry2: json["date_of_expiry_2"] ?? '',
    countryOfIssue2: json["country_of_issue_2"] ?? '',
    attachment2: json["attachment_2"] ?? '',
    pic2: json["pic_2"] ?? '',
    generalOperatorsCertificateNo:
    json["general_operators_certificate_no"] ?? '',
    dateOfIssue3: json["date_of_issue_3"] ?? '',
    dateOfExpiry3: json["date_of_expiry_3"] ?? '',
    countryOfIssue3: json["country_of_issue_3"] ?? '',
    attachment3: json["attachment_3"] ?? '',
    flagStateEndorsementNo: json["flag_state_endorsement__no"] ?? '',
    dateOfIssue4: json["date_of_issue_4"] ?? '',
    dateOfExpiry4: json["date_of_expiry_4"] ?? '',
    countryOfIssue4: json["country_of_issue_4"] ?? '',
    attachment4: json["attachment_4"] ?? '',
    pic4: json["pic_4"] ?? '',
    education: json["education"] ?? '',
    stcwTrainings: json["stcw_trainings"] ?? '',
    trainingName: json["training_name"] ?? '',
    issuingCountry: json["issuing_country"] ?? '',
    number: json["number"] ?? '',
    issueDate: json["issue_date"] ?? '',
    expiryDate: json["expiry_date"] ?? '',
    nameOfShip: json["name_of_ship"] ?? '',
    typeOfShip: json["type_of_ship"] ?? '',
    dwtFrom: json["dwt_from"] ?? '',
    dwtTo: json["dwt_to"] ?? '',
    age: json["age"] ?? 0,
    designation: json["designation"] ?? '',
    passportCountryOfIssue: json["passport_country_of_issue"] ?? '',
    seamanCountryOfIssue: json["seaman_country_of_issue"] ?? '',
    passportDateOfIssue: json["passport_date_of_issue"] ?? '',
    passportDateOfExpiry: json["passport_date_of_expiry"] ?? '',
    seamanDateOfIssue: json["seaman_date_of_issue"] ?? '',
    seamanDateOfExpiry: json["seaman_date_of_expiry"] ?? '',
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
    "_seen": seen,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "full_name": fullName,
    "email_id": emailId,
    "indos_no": indosNo,
    "photo": photo,
    "view": view,
    "data_12": data12,
    "current_rank": currentRank,
    "dob": dob,
    "gender": gender,
    "nationality": nationality,
    "city_of_birth": cityOfBirth,
    "state_of_birth": stateOfBirth,
    "marital_status": maritalStatus,
    "no_of_children": noOfChildren,
    "home_address": homeAddress,
    "mobile_number": mobileNumber,
    "nearest_airport": nearestAirport,
    "alternate_email": alternateEmail,
    "passport_number": passportNumber,
    "date_of_issue": dateOfIssue,
    "date_of_expiry": dateOfExpiry,
    "country_of_issue": countryOfIssue,
    "attachment": attachment,
    "pic": pic,
    "seaman_book_no": seamanBookNo,
    "date_of_issue_1": dateOfIssue1,
    "date_of_expiry_1": dateOfExpiry1,
    "country_of_issue_1": countryOfIssue1,
    "attachment_1": attachment1,
    "pic_1": pic1,
    "certificate_of_competency_no": certificateOfCompetencyNo,
    "date_of_issue_2": dateOfIssue2,
    "date_of_expiry_2": dateOfExpiry2,
    "country_of_issue_2": countryOfIssue2,
    "attachment_2": attachment2,
    "pic_2": pic2,
    "general_operators_certificate_no": generalOperatorsCertificateNo,
    "date_of_issue_3": dateOfIssue3,
    "date_of_expiry_3": dateOfExpiry3,
    "country_of_issue_3": countryOfIssue3,
    "attachment_3": attachment3,
    "flag_state_endorsement__no": flagStateEndorsementNo,
    "date_of_issue_4": dateOfIssue4,
    "date_of_expiry_4": dateOfExpiry4,
    "country_of_issue_4": countryOfIssue4,
    "attachment_4": attachment4,
    "pic_4": pic4,
    "education": education,
    "stcw_trainings": stcwTrainings,
    "training_name": trainingName,
    "issuing_country": issuingCountry,
    "number": number,
    "issue_date": issueDate,
    "expiry_date": expiryDate,
    "name_of_ship": nameOfShip,
    "type_of_ship": typeOfShip,
    "dwt_from": dwtFrom,
    "dwt_to": dwtTo,
    "age": age,
    "designation": designation,
    "passport_country_of_issue": passportCountryOfIssue,
    "seaman_country_of_issue": seamanCountryOfIssue,
    "passport_date_of_issue": passportDateOfIssue,
    "passport_date_of_expiry": passportDateOfExpiry,
    "seaman_date_of_issue": seamanDateOfIssue,
    "seaman_date_of_expiry": seamanDateOfExpiry,
  };
}
