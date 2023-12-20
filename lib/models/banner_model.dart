// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  List<Banner> banner;

  BannerModel({
    required this.banner,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        banner:
            List<Banner>.from(json["Banner"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Banner": List<dynamic>.from(banner.map((x) => x.toJson())),
      };
}

class Banner {
  int id;
  String bannerImage;
  dynamic heading;
  dynamic paragraph;

  Banner({
    required this.id,
    required this.bannerImage,
    required this.heading,
    required this.paragraph,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["Id"],
        bannerImage: json["BannerImage"],
        heading: json["Heading"],
        paragraph: json["Paragraph"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "BannerImage": bannerImage,
        "Heading": heading,
        "Paragraph": paragraph,
      };
}
