// To parse this JSON data, do
//
//     final driverBookingHistoryModel = driverBookingHistoryModelFromJson(jsonString);

import 'dart:convert';

DriverBookingHistoryModel driverBookingHistoryModelFromJson(String str) =>
    DriverBookingHistoryModel.fromJson(json.decode(str));

String driverBookingHistoryModelToJson(DriverBookingHistoryModel data) =>
    json.encode(data.toJson());

class DriverBookingHistoryModel {
  List<BookingHistory2>? bookingHistory;

  DriverBookingHistoryModel({
    this.bookingHistory,
  });

  factory DriverBookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverBookingHistoryModel(
        bookingHistory: json["BookingHistory"] == null
            ? []
            : List<BookingHistory2>.from(json["BookingHistory"]!
                .map((x) => BookingHistory2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "BookingHistory": bookingHistory == null
            ? []
            : List<dynamic>.from(bookingHistory!.map((x) => x.toJson())),
      };
}

class BookingHistory2 {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? stateName;
  String? cityName;
  String? location;
  String? pinCode;

  BookingHistory2({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.stateName,
    this.cityName,
    this.location,
    this.pinCode,
  });

  factory BookingHistory2.fromJson(Map<String, dynamic> json) =>
      BookingHistory2(
        id: json["Id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        location: json["Location"],
        pinCode: json["PinCode"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "StateName": stateName,
        "CityName": cityName,
        "Location": location,
        "PinCode": pinCode,
      };
}
