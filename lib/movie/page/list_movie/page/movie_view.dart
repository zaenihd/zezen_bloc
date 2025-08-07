import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/movie/page/detail_movie/view/detail_movie.dart';
import 'package:flutter_bloc_zezen/movie/page/list_movie/bloc/movie_bloc.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  void initState() {
    context.read<MovieBloc>().add(GetMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          log("message ${state.listMovie}");
          log("isLo ${state.isLoading}");
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.listMovie != null) {
            return _gridMovie(state);
          }
          if (state.error != null) {
            return Center(
              child: Text('${state.error}'),
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }

  GridView _gridMovie(MovieState state) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.0,
        crossAxisCount: 3,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemCount: state.listMovie!.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final movie = state.listMovie![index];
        return InkWell(
          onTap: () {
            log(movie.imdbId);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMovie(id: movie.imdbId),
                ));
          },
          child: Container(
            color: Colors.orange,
            child: Image.network(movie.poster),
          ),
        );
      },
    );
  }
}
