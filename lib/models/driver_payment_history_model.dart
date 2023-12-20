// To parse this JSON data, do
//
//     final driverPaymentHistoryModel = driverPaymentHistoryModelFromJson(jsonString);

import 'dart:convert';

DriverPaymentHistoryModel driverPaymentHistoryModelFromJson(String str) =>
    DriverPaymentHistoryModel.fromJson(json.decode(str));

String driverPaymentHistoryModelToJson(DriverPaymentHistoryModel data) =>
    json.encode(data.toJson());

class DriverPaymentHistoryModel {
  List<BookingHistory>? paymentHistory;

  DriverPaymentHistoryModel({
    this.paymentHistory,
  });

  factory DriverPaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverPaymentHistoryModel(
        paymentHistory: json["PaymentHistory"] == null
            ? []
            : List<BookingHistory>.from(
                json["PaymentHistory"]!.map((x) => BookingHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PaymentHistory": paymentHistory == null
            ? []
            : List<dynamic>.from(paymentHistory!.map((x) => x.toJson())),
      };
}

class BookingHistory {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? location;
  num? paymentId;
  num? totalPrice;
  DateTime? paymentDate;
  String? isPay;

  BookingHistory({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.location,
    this.paymentId,
    this.totalPrice,
    this.paymentDate,
    this.isPay,
  });

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
        id: json["Id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        paymentId: json["PaymentId"],
        totalPrice: json["TotalPrice"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
        isPay: json["IsPay"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "Location": location,
        "PaymentId": paymentId,
        "TotalPrice": totalPrice,
        "PaymentDate": paymentDate?.toIso8601String(),
        "IsPay": isPay,
      };
}
