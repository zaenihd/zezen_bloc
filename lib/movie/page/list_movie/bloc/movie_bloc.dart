import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_zezen/movie/data/model/movie_model.dart';
import 'package:flutter_bloc_zezen/movie/data/repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState()) {
    final repository = MovieRepository();
    on<GetMovieEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        List<SearchMovie> data = await repository.getMovie();
        log("ini dataa $data");
        emit(state.copyWith(listMovie: data));
        emit(state.copyWith(isLoading: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
      }
      // TODO: implement event handler
    });
  }
}
