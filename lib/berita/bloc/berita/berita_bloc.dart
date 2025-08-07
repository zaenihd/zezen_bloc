import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_zezen/data/model/berita_model.dart';
import 'package:flutter_bloc_zezen/data/repository/berita_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'berita_event.dart';
part 'berita_state.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  BeritaBloc() : super(BeritaState()) {
    final beritaRepository = BeritaRepository();
    on<GetALlBerita>((event, emit) async {
      final dataBeritaFromDatabase = event.boxBerita.get('beritaData');
      if (dataBeritaFromDatabase == null) {
          print("ini dari dari API base");
        emit(state.copyWith(isLoading: true));
        try {
          BeritaDataModel result = await beritaRepository.getAllBerita();
          emit(state.copyWith(berita: result.data));
          event.boxBerita.put("beritaData", result);
          emit(state.copyWith(isLoading: false));
        } catch (e) {
          emit(state.copyWith(error: e.toString()));

          emit(state.copyWith(isLoading: false));
        }
      } else {
        log("ini dari data base");
        emit(state.copyWith(berita: dataBeritaFromDatabase.data));
      }
      // TODO: implement event handler
    });
  }
}
