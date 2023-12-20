// To parse this JSON data, do
//
//     final gallaryModel = gallaryModelFromJson(jsonString);

import 'dart:convert';

GallaryModel gallaryModelFromJson(String str) =>
    GallaryModel.fromJson(json.decode(str));

String gallaryModelToJson(GallaryModel data) => json.encode(data.toJson());

class GallaryModel {
  List<Gallery>? gallery;

  GallaryModel({
    this.gallery,
  });

  factory GallaryModel.fromJson(Map<String, dynamic> json) => GallaryModel(
        gallery: json["Gallery"] == null
            ? []
            : List<Gallery>.from(
                json["Gallery"]!.map((x) => Gallery.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Gallery": gallery == null
            ? []
            : List<dynamic>.from(gallery!.map((x) => x.toJson())),
      };
}

class Gallery {
  int? id;
  String? image;
  String? content;

  Gallery({
    this.id,
    this.image,
    this.content,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["Id"],
        image: json["Image"],
        content: json["Content"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Image": image,
        "Content": content,
      };
}
