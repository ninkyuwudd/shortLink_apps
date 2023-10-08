// To parse this JSON data, do

//   final DataLink = DataLinkFromJson(jsonString);
import 'dart:convert';

final String tableLink = "shortLink";

class LinkFields {
  static final List<String> values = [id, title, date, shortUrl, longUrl];

  static final String id = 'id';
  static final String title = 'title';
  static final String date = 'date';
  static final String shortUrl = 'shortUrl';
  static final String longUrl = 'longUrl';
}

DataLink dataLinkFromJson(String str) => DataLink.fromJson(json.decode(str));

String dataLinkToJson(DataLink data) => json.encode(data.toJson());

class DataLink {
  int? id;
  String title;
  String date;
  String shortUrl;
  String longUrl;

  DataLink({
    required this.id,
    required this.title,
    required this.date,
    required this.shortUrl,
    required this.longUrl,
  });

  factory DataLink.fromJson(Map<String, dynamic> json) => DataLink(
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

  DataLink copy(
          {int? id,
          String? title,
          String? date,
          String? shortUrl,
          String? longUrl}) =>
      DataLink(
          id: id ?? this.id,
          title: title ?? this.title,
          date: date ?? this.date,
          shortUrl: shortUrl ?? this.shortUrl,
          longUrl: longUrl ?? this.longUrl);
}
