import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_zezen/movie/data/model/detail_movie_model.dart';
import 'package:flutter_bloc_zezen/movie/data/model/movie_model.dart';

class MovieRepository {
  final dio = Dio();

  Future<dynamic> getMovie() async {
    try {
      final result =
          await dio.get("http://www.omdbapi.com/?apikey=9a76d076&s=new&page=7");
      final data = movieModelFromJson(result.toString());
      return data.search;
    } catch (e) {
      log(e.toString());
    }
  }
  Future<dynamic> fetchDetailMovie(String id) async {
    try {
      final result =
          await dio.get("http://www.omdbapi.com/?i=$id&apikey=9a76d076");
      final data = detailMovieFromJson(result.toString());
      log("ini dataa $data");
      return data;
    } catch (e) {
      log("ini error$e");
    }
  }
}
