// To parse this JSON data, do
//
//     final statesModel = statesModelFromJson(jsonString);

import 'dart:convert';

StatesModel statesModelFromJson(String str) =>
    StatesModel.fromJson(json.decode(str));

String statesModelToJson(StatesModel data) => json.encode(data.toJson());

class StatesModel {
  List<StateModel> states;

  StatesModel({
    required this.states,
  });

  factory StatesModel.fromJson(Map<String, dynamic> json) => StatesModel(
        states: List<StateModel>.from(
            json["State"].map((x) => StateModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "State": List<dynamic>.from(states.map((x) => x.toJson())),
      };
}

class StateModel {
  int id;
  String stateName;
  bool isDeleted;
  dynamic statelist;

  StateModel({
    required this.id,
    required this.stateName,
    required this.isDeleted,
    required this.statelist,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["Id"],
        stateName: json["StateName"],
        isDeleted: json["IsDeleted"],
        statelist: json["Statelist"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "StateName": stateName,
        "IsDeleted": isDeleted,
        "Statelist": statelist,
      };
}
