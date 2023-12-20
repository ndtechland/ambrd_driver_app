// To parse this JSON data, do
//
//     final getProfileDetail = getProfileDetailFromJson(jsonString);

import 'dart:convert';

GetProfileDetail getProfileDetailFromJson(String str) =>
    GetProfileDetail.fromJson(json.decode(str));

String getProfileDetailToJson(GetProfileDetail data) =>
    json.encode(data.toJson());

class GetProfileDetail {
  int? id;
  String? driverName;
  String? emailId;
  String? mobileNumber;
  String? location;
  String? pinCode;
  String? stateName;
  String? cityName;
  String? driverImage;
  DateTime? dob;

  GetProfileDetail({
    this.id,
    this.driverName,
    this.emailId,
    this.mobileNumber,
    this.location,
    this.pinCode,
    this.stateName,
    this.cityName,
    this.driverImage,
    this.dob,
  });

  factory GetProfileDetail.fromJson(Map<String, dynamic> json) =>
      GetProfileDetail(
        id: json["Id"],
        driverName: json["DriverName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        pinCode: json["PinCode"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        driverImage: json["DriverImage"],
        dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverName": driverName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Location": location,
        "PinCode": pinCode,
        "StateName": stateName,
        "CityName": cityName,
        "DriverImage": driverImage,
        "DOB": dob?.toIso8601String(),
      };
}
