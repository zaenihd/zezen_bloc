import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/berita/bloc/berita/berita_bloc.dart';
import 'package:flutter_bloc_zezen/data/helper/hive_helper.dart';
import 'package:flutter_bloc_zezen/data/model/berita_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BeritaView extends StatefulWidget {
  const BeritaView({super.key});

  @override
  State<BeritaView> createState() => _BeritaViewState();
}

class _BeritaViewState extends State<BeritaView> {
  late Box<BeritaDataModel> boxBerita;

  @override
  void initState() {
    boxBerita = HiveHelper.getAllBerita();
    context.read<BeritaBloc>().add(GetALlBerita(boxBerita: boxBerita));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Berita"),
        ),
        body: BlocBuilder<BeritaBloc, BeritaState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.berita != null) {
              return ListView.builder(
                itemCount: state.berita!.length,
                itemBuilder: (context, index) {
                  final berita = state.berita![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          berita.photo,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.sizeOf(context).width / 1.7,
                                child: Text(
                                  berita.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                                width: MediaQuery.sizeOf(context).width / 1.7,
                                child: Text(berita.createdAt)),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }
            if (state.error != null) {
              Center(
                child: Text(state.error!),
              );
            }
            return const Center(
              child: Text("No data"),
            );
          },
        ));
  }
}
