// To parse this JSON data, do
//
//     final driverPayoutHistoryModel = driverPayoutHistoryModelFromJson(jsonString);

import 'dart:convert';

DriverPayoutHistoryModel driverPayoutHistoryModelFromJson(String str) =>
    DriverPayoutHistoryModel.fromJson(json.decode(str));

String driverPayoutHistoryModelToJson(DriverPayoutHistoryModel data) =>
    json.encode(data.toJson());

class DriverPayoutHistoryModel {
  List<PayoutHistory>? payoutHistory;

  DriverPayoutHistoryModel({
    this.payoutHistory,
  });

  factory DriverPayoutHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverPayoutHistoryModel(
        payoutHistory: json["PayoutHistory"] == null
            ? []
            : List<PayoutHistory>.from(
                json["PayoutHistory"]!.map((x) => PayoutHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PayoutHistory": payoutHistory == null
            ? []
            : List<dynamic>.from(payoutHistory!.map((x) => x.toJson())),
      };
}

class PayoutHistory {
  int? id;
  String? driverName;
  DateTime? payoutDate;
  num? amount;

  PayoutHistory({
    this.id,
    this.driverName,
    this.payoutDate,
    this.amount,
  });

  factory PayoutHistory.fromJson(Map<String, dynamic> json) => PayoutHistory(
        id: json["Id"],
        driverName: json["DriverName"],
        payoutDate: json["PayoutDate"] == null
            ? null
            : DateTime.parse(json["PayoutDate"]),
        amount: json["Amount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverName": driverName,
        "PayoutDate": payoutDate?.toIso8601String(),
        "Amount": amount,
      };
}
