// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String id;
  String title;
  String date;
  String shortUrl;
  String longUrl;

  Welcome({
    required this.id,
    required this.title,
    required this.date,
    required this.shortUrl,
    required this.longUrl,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        shortUrl: json["shortUrl"],
        longUrl: json["longUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date": date,
        "shortUrl": shortUrl,
        "longUrl": longUrl,
      };
}
