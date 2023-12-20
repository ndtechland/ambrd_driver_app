// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  List<City> cities;

  CityModel({
    required this.cities,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        cities: List<City>.from(json["District"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "District": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  int id;
  String cityName;
  int stateId;
  bool isDeleted;
  dynamic states;
  dynamic citylist;

  City({
    required this.id,
    required this.cityName,
    required this.stateId,
    required this.isDeleted,
    required this.states,
    required this.citylist,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["Id"],
        cityName: json["CityName"],
        stateId: json["State_Id"],
        isDeleted: json["IsDeleted"],
        states: json["States"],
        citylist: json["Citylist"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CityName": cityName,
        "State_Id": stateId,
        "IsDeleted": isDeleted,
        "States": states,
        "Citylist": citylist,
      };
}
