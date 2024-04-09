// To parse this JSON data, do
//
//     final activeTrainingListModel = activeTrainingListModelFromJson(jsonString);

import 'dart:convert';

import 'package:salorify/model/training_list.dart';

ActiveTrainingListModel activeTrainingListModelFromJson(String str) => ActiveTrainingListModel.fromJson(json.decode(str));

String activeTrainingListModelToJson(ActiveTrainingListModel data) => json.encode(data.toJson());

class ActiveTrainingListModel {
  List<TrainingList> data;

  ActiveTrainingListModel({
    required this.data,
  });

  factory ActiveTrainingListModel.fromJson(Map<String, dynamic> json) => ActiveTrainingListModel(
    data: List<TrainingList>.from(json["data"].map((x) => TrainingList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

