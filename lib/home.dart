import 'package:flutter/material.dart';
import 'package:flutter_bloc_zezen/berita/views/list_berita.dart';
import 'package:flutter_bloc_zezen/movie/page/list_movie/page/movie_view.dart';
import 'package:flutter_bloc_zezen/profile/page/auth/view/login.dart';
import 'package:flutter_bloc_zezen/quran/page/surat/view/surat_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("My App"),),
      body: ListView(
        children: [
          ListTile(title: const Text("Al-Quran"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SuratView(),));
          },
          trailing: const Icon(Icons.arrow_forward_ios_outlined),),
          const SizedBox(
            height: 10.0,
          ),
          ListTile(title: const Text("Profile"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginView(),));
          },
          trailing: const Icon(Icons.arrow_forward_ios_outlined),),
          ListTile(title: const Text("Movie"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MovieView(),));
          },
          trailing: const Icon(Icons.arrow_forward_ios_outlined),),
          ListTile(title: const Text("Berita"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const BeritaView(),));
          },
          trailing: const Icon(Icons.arrow_forward_ios_outlined),),
        ],
      ),
    );
  }
}