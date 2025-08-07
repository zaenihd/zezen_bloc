// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_bloc.dart';

class MovieState extends Equatable {

  List<SearchMovie>? listMovie;
  bool isLoading;
  String? error;
  MovieState({
     this.listMovie,
     this.isLoading = false,
    this.error,
  });
  
  @override
  List<Object?> get props => [listMovie, isLoading, error];

  MovieState copyWith({
    List<SearchMovie>? listMovie,
    bool? isLoading,
    String? error,
  }) {
    return MovieState(
      listMovie: listMovie ?? this.listMovie,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
