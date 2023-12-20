// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  String? role;
  Data? data;
  String? message;
  int? status;

  Message({
    this.role,
    this.data,
    this.message,
    this.status,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["Message"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "data": data!.toJson(),
        "Message": message,
        "Status": status,
      };
}

class Data {
  int? userId;
  String? emailId;
  dynamic mobileNumber;
  String? location;
  String? patientName;
  String? stateName;
  String? cityName;
  num? stateMasterId;
  num? cityMasterId;
  num? adminLoginId;
  String? pinCode;

  Data({
    this.userId,
    this.emailId,
    this.mobileNumber,
    this.location,
    this.patientName,
    this.stateName,
    this.cityName,
    this.stateMasterId,
    this.cityMasterId,
    this.adminLoginId,
    this.pinCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["UserId"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        patientName: json["PatientName"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        stateMasterId: json["StateMaster_Id"],
        cityMasterId: json["CityMaster_Id"],
        adminLoginId: json["AdminLogin_Id"],
        pinCode: json["PinCode"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Location": location,
        "PatientName": patientName,
        "StateName": stateName,
        "CityName": cityName,
        "StateMaster_Id": stateMasterId,
        "CityMaster_Id": cityMasterId,
        "AdminLogin_Id": adminLoginId,
        "PinCode": pinCode,
      };
}
