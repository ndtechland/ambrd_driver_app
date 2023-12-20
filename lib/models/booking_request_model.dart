// To parse this JSON data, do
//
//     final driverBookingRequestListModel = driverBookingRequestListModelFromJson(jsonString);

import 'dart:convert';

DriverBookingRequestListModel driverBookingRequestListModelFromJson(
        String str) =>
    DriverBookingRequestListModel.fromJson(json.decode(str));

String driverBookingRequestListModelToJson(
        DriverBookingRequestListModel data) =>
    json.encode(data.toJson());

class DriverBookingRequestListModel {
  List<UserListForBookingAmbulance>? userListForBookingAmbulance;

  DriverBookingRequestListModel({
    this.userListForBookingAmbulance,
  });

  factory DriverBookingRequestListModel.fromJson(Map<String, dynamic> json) =>
      DriverBookingRequestListModel(
        userListForBookingAmbulance: json["UserListForBookingAmbulance"] == null
            ? []
            : List<UserListForBookingAmbulance>.from(
                json["UserListForBookingAmbulance"]!
                    .map((x) => UserListForBookingAmbulance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UserListForBookingAmbulance": userListForBookingAmbulance == null
            ? []
            : List<dynamic>.from(
                userListForBookingAmbulance!.map((x) => x.toJson())),
      };
}

class UserListForBookingAmbulance {
  int? id;
  int? patientId;
  String? patientName;
  String? mobileNumber;
  double? endLat;
  double? endLong;
  double? startLat;
  double? startLong;
  String? deviceId;
  num? totalPrice;
  num? totalDistance;
  num? noOfPassengers;
  String? reverseStartLatLongToLocation;
  String? reverseEndLatLongToLocation;
  String? duration;

  UserListForBookingAmbulance({
    this.id,
    this.patientId,
    this.patientName,
    this.mobileNumber,
    this.endLat,
    this.endLong,
    this.startLat,
    this.startLong,
    this.deviceId,
    this.totalPrice,
    this.totalDistance,
    this.noOfPassengers,
    this.reverseStartLatLongToLocation,
    this.reverseEndLatLongToLocation,
    this.duration,
  });

  factory UserListForBookingAmbulance.fromJson(Map<String, dynamic> json) =>
      UserListForBookingAmbulance(
        id: json["Id"],
        patientId: json["PatientId"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        endLat: json["endLat"]?.toDouble(),
        endLong: json["endLong"]?.toDouble(),
        startLat: json["startLat"]?.toDouble(),
        startLong: json["startLong"]?.toDouble(),
        deviceId: json["DeviceId"],
        totalPrice: json["TotalPrice"],
        totalDistance: json["TotalDistance"],
        noOfPassengers: json["NoOfPassengers"],
        reverseStartLatLongToLocation: json["ReverseStartLatLong_To_Location"],
        reverseEndLatLongToLocation: json["ReverseEndLatLong_To_Location"],
        duration: json["Duration"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientId": patientId,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "endLat": endLat,
        "endLong": endLong,
        "startLat": startLat,
        "startLong": startLong,
        "DeviceId": deviceId,
        "TotalPrice": totalPrice,
        "TotalDistance": totalDistance,
        "NoOfPassengers": noOfPassengers,
        "ReverseStartLatLong_To_Location": reverseStartLatLongToLocation,
        "ReverseEndLatLong_To_Location": reverseEndLatLongToLocation,
        "Duration": duration,
      };
}
