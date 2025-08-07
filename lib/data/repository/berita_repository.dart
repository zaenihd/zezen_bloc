import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_zezen/data/model/berita_model.dart';

class BeritaRepository {
   final dio = Dio();

  Future<dynamic> getAllBerita() async {
    try {
      final response = await dio.get('https://www.penainsight.com/mobile/api/news/list?limit=10&page=1');
      final data = beritaDataModelFromJson(response.toString());
      return data;
    } catch (e) {
      log("$e");
    }
  }
}