// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_movie_bloc.dart';

class DetailMovieState extends Equatable {
  DetailMovie? detailMovie;
  bool isLoading;
  String error;
  DetailMovieState({
    this.detailMovie,
    this.isLoading = false,
    this.error = "",
  });

  @override
  List<Object?> get props => [detailMovie, isLoading, error];

  DetailMovieState copyWith({
    DetailMovie? detailMovie,
    bool? isLoading,
    String? error,
  }) {
    return DetailMovieState(
      detailMovie: detailMovie ?? this.detailMovie,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
