// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  String email;
  String password;
  BuildContext context;
  LoginEvent({
    required this.email,
    required this.password,
    required this.context,
  });
}
