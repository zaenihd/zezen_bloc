// To parse this JSON data, do
//
//     final beritaDataModel = beritaDataModelFromJson(jsonString);

import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
part 'berita_model.g.dart';

BeritaDataModel beritaDataModelFromJson(String str) =>
    BeritaDataModel.fromJson(json.decode(str));

String beritaDataModelToJson(BeritaDataModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 1)
class BeritaDataModel {
  @HiveField(0)
  bool status;
  @HiveField(1)
  List<Berita> data;
  @HiveField(2)
  String message;

  BeritaDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory BeritaDataModel.fromJson(Map<String, dynamic> json) =>
      BeritaDataModel(
        status: json["status"],
        data: List<Berita>.from(json["data"].map((x) => Berita.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

@HiveType(typeId: 2)
class Berita {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String photo;
  @HiveField(3)
  String video;
  @HiveField(4)
  String date;
  @HiveField(5)
  String createdAt;
  @HiveField(6)
  String categoryName;
  @HiveField(7)
  String like;
  @HiveField(8)
  String bookmark;

  Berita({
    required this.id,
    required this.title,
    required this.photo,
    required this.video,
    required this.date,
    required this.createdAt,
    required this.categoryName,
    required this.like,
    required this.bookmark,
  });

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        id: json["id"],
        title: json["title"],
        photo: json["photo"],
        video: json["video"],
        date: json["date"],
        createdAt: json["created_at"],
        categoryName: json["category_name"],
        like: json["like"],
        bookmark: json["bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "photo": photo,
        "video": video,
        "date": date,
        "created_at": createdAt,
        "category_name": categoryName,
        "like": like,
        "bookmark": bookmark,
      };
}
