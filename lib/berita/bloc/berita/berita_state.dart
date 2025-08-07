// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'berita_bloc.dart';

class BeritaState extends Equatable {
  List<Berita>? berita;
  String? error;
  bool? isLoading;
  BeritaState({
     this.berita,
     this.error = "",
    this.isLoading = false,
  });

  
  @override
  List<Object?> get props => [berita, error, isLoading];

  BeritaState copyWith({
    List<Berita>? berita,
    String? error,
    bool? isLoading,
  }) {
    return BeritaState(
      berita: berita ?? this.berita,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

