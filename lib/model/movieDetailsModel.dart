// To parse this JSON data, do
//
//     final movieDetailsModel = movieDetailsModelFromJson(jsonString);

import 'dart:convert';

MovieDetailsModel movieDetailsModelFromJson(String str) => MovieDetailsModel.fromJson(json.decode(str));

String movieDetailsModelToJson(MovieDetailsModel data) => json.encode(data.toJson());

class MovieDetailsModel {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<Rating>? ratings;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbId;
  String? type;
  String? dvd;
  String? boxOffice;
  String? production;
  String? website;
  String? response;

  MovieDetailsModel({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbId,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
    title: json["Title"],
    year: json["Year"],
    rated: json["Rated"],
    released: json["Released"],
    runtime: json["Runtime"],
    genre: json["Genre"],
    director: json["Director"],
    writer: json["Writer"],
    actors: json["Actors"],
    plot: json["Plot"],
    language: json["Language"],
    country: json["Country"],
    awards: json["Awards"],
    poster: json["Poster"],
    ratings: json["Ratings"] == null ? [] : List<Rating>.from(json["Ratings"]!.map((x) => Rating.fromJson(x))),
    metascore: json["Metascore"],
    imdbRating: json["imdbRating"],
    imdbVotes: json["imdbVotes"],
    imdbId: json["imdbID"],
    type: json["Type"],
    dvd: json["DVD"],
    boxOffice: json["BoxOffice"],
    production: json["Production"],
    website: json["Website"],
    response: json["Response"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "Rated": rated,
    "Released": released,
    "Runtime": runtime,
    "Genre": genre,
    "Director": director,
    "Writer": writer,
    "Actors": actors,
    "Plot": plot,
    "Language": language,
    "Country": country,
    "Awards": awards,
    "Poster": poster,
    "Ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
    "Metascore": metascore,
    "imdbRating": imdbRating,
    "imdbVotes": imdbVotes,
    "imdbID": imdbId,
    "Type": type,
    "DVD": dvd,
    "BoxOffice": boxOffice,
    "Production": production,
    "Website": website,
    "Response": response,
  };
}

class Rating {
  String? source;
  String? value;

  Rating({
    this.source,
    this.value,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    source: json["Source"],
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Source": source,
    "Value": value,
  };
}