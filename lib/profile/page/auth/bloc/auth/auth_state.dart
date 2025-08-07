// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {

  bool isLoading;
  String? token;
  String? error;
  AuthState({
     this.isLoading = false,
     this.token ,
    this.error,
  });

  
  @override
  List<Object> get props => [];

  AuthState copyWith({
    bool? isLoading,
    String? token,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}

