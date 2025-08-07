// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'berita_bloc.dart';

sealed class BeritaEvent extends Equatable {
  const BeritaEvent();

  @override
  List<Object> get props => [];
}

class GetALlBerita extends BeritaEvent {
  Box<BeritaDataModel> boxBerita;
  GetALlBerita({
    required this.boxBerita,
  });
}
