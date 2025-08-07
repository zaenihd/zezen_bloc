// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_movie_bloc.dart';

sealed class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailMovie extends DetailMovieEvent {
  String id;
  FetchDetailMovie({
    required this.id,
  });
}
