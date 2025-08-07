import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/movie/page/detail_movie/bloc/detail_movie_bloc.dart';

class DetailMovie extends StatefulWidget {
  DetailMovie({super.key, required this.id});

  String id;

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  @override
  void initState() {
    context.read<DetailMovieBloc>().add(FetchDetailMovie(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Movie"),
          actions: const [],
        ),
        body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.detailMovie != null) {
              final movie = state.detailMovie;
              return ListView(
                children: [
                  Image.network(movie!.poster),
                  Text(movie.title),
                  Text(movie.genre),
                ],
              );
            }
            if (state.error != "") {
              return Text(state.error);
            }
            return const Text("No data");
          },
        ));
  }
}
