import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/berita/bloc/berita/berita_bloc.dart';
import 'package:flutter_bloc_zezen/data/model/berita_model.dart';
import 'package:flutter_bloc_zezen/home.dart';
import 'package:flutter_bloc_zezen/movie/page/detail_movie/bloc/detail_movie_bloc.dart';
import 'package:flutter_bloc_zezen/movie/page/list_movie/bloc/movie_bloc.dart';
import 'package:flutter_bloc_zezen/profile/page/auth/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_zezen/quran/page/detail_surat/cubit/detail_surat/detail_surat_cubit.dart';
import 'package:flutter_bloc_zezen/quran/page/surat/bloc/surat/surat_bloc.dart';
import 'package:flutter_bloc_zezen/quran/data/repository/surat_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init hive setelah install package
  await Hive.initFlutter();
  Hive.registerAdapter<BeritaDataModel>(BeritaDataModelAdapter());
  Hive.registerAdapter<Berita>(BeritaAdapter());
  await Hive.openBox<BeritaDataModel>("berita");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SuratBloc(),
          // create: (context) => SuratCubit(SuratRepository()),
        ),
        BlocProvider(
          create: (context) => DetailSuratCubit(SuratRepository()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => MovieBloc(),
        ),
        BlocProvider(
          create: (context) => DetailMovieBloc(),
        ),
        BlocProvider(
          create: (context) => BeritaBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
