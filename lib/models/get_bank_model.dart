// To parse this JSON data, do
//
//     final bankGetModel = bankGetModelFromJson(jsonString);

import 'dart:convert';

BankGetModel bankGetModelFromJson(String str) =>
    BankGetModel.fromJson(json.decode(str));

String bankGetModelToJson(BankGetModel data) => json.encode(data.toJson());

class BankGetModel {
  int? loginId;
  String? accountNumber;
  String? ifscCode;
  String? branchName;
  String? branchAddress;
  String? holderName;
  String? mobileNumber;

  BankGetModel({
    this.loginId,
    this.accountNumber,
    this.ifscCode,
    this.branchName,
    this.branchAddress,
    this.holderName,
    this.mobileNumber,
  });

  factory BankGetModel.fromJson(Map<String, dynamic> json) => BankGetModel(
        loginId: json["Login_Id"],
        accountNumber: json["AccountNumber"],
        ifscCode: json["IFSCCode"],
        branchName: json["BranchName"],
        branchAddress: json["BranchAddress"],
        holderName: json["HolderName"],
        mobileNumber: json["MobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "Login_Id": loginId,
        "AccountNumber": accountNumber,
        "IFSCCode": ifscCode,
        "BranchName": branchName,
        "BranchAddress": branchAddress,
        "HolderName": holderName,
        "MobileNumber": mobileNumber,
      };
}
