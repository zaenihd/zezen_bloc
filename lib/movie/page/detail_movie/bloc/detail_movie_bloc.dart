import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_zezen/movie/data/model/detail_movie_model.dart';
import 'package:flutter_bloc_zezen/movie/data/repository/movie_repository.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  DetailMovieBloc() : super(DetailMovieState()) {
    final movieRepo = MovieRepository();

    on<FetchDetailMovie>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final result = await movieRepo.fetchDetailMovie(event.id);
        emit(state.copyWith(detailMovie: result));
        emit(state.copyWith(isLoading: false));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
        emit(state.copyWith(isLoading: false));
      }
      // TODO: implement event handler
    });
  }
}
