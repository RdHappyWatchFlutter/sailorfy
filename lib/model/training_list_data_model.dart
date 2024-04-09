// To parse this JSON data, do
//
//     final trainingListDataModel = trainingListDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:salorify/model/training_list.dart';

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
