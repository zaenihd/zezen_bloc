// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
    final List<SearchMovie> search;
    final String totalResults;
    final String response;

    MovieModel({
        required this.search,
        required this.totalResults,
        required this.response,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        search: List<SearchMovie>.from(json["Search"].map((x) => SearchMovie.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
    );

    Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
    };
}

class SearchMovie {
    final String title;
    final String year;
    final String imdbId;
    final Type type;
    final String poster;

    SearchMovie({
        required this.title,
        required this.year,
        required this.imdbId,
        required this.type,
        required this.poster,
    });

    factory SearchMovie.fromJson(Map<String, dynamic> json) => SearchMovie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map[json["Type"]]!,
        poster: json["Poster"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse[type],
        "Poster": poster,
    };
}

enum Type {
    GAME,
    MOVIE,
    SERIES
}

final typeValues = EnumValues({
    "game": Type.GAME,
    "movie": Type.MOVIE,
    "series": Type.SERIES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
