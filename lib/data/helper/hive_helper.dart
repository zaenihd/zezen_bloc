import 'package:flutter_bloc_zezen/data/model/berita_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static Box<BeritaDataModel> getAllBerita() => Hive.box<BeritaDataModel>("berita");

}