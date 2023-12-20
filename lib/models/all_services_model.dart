// To parse this JSON data, do
//
//     final allServicesUser = allServicesUserFromJson(jsonString);

import 'dart:convert';

AllServicesUser allServicesUserFromJson(String str) =>
    AllServicesUser.fromJson(json.decode(str));

String allServicesUserToJson(AllServicesUser data) =>
    json.encode(data.toJson());

class AllServicesUser {
  List<OurService>? ourService;
  AllServicesUser({
    this.ourService,
  });

  factory AllServicesUser.fromJson(Map<String, dynamic> json) =>
      AllServicesUser(
        ourService: json["OurService"] == null
            ? []
            : List<OurService>.from(
                json["OurService"]!.map((x) => OurService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "OurService": ourService == null
            ? []
            : List<dynamic>.from(ourService!.map((x) => x.toJson())),
      };
}

class OurService {
  int? id;
  String? serviceName;
  String? image;
  String? description;

  OurService({
    this.id,
    this.serviceName,
    this.image,
    this.description,
  });

  factory OurService.fromJson(Map<String, dynamic> json) => OurService(
        id: json["Id"],
        serviceName: json["ServiceName"],
        image: json["Image"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ServiceName": serviceName,
        "Image": image,
        "Description": description,
      };
}
