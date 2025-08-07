import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_zezen/data/api_service/dio_service.dart';
import 'package:flutter_bloc_zezen/profile/page/account/view/account_view.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final data = await ApiService().postRequest("/api/login", {
          "email": event.email,
          "password": event.password,
          "token": "",
          "social_id": "",
          "social_type": ""
        });
        log("message $data");
        emit(state.copyWith(token: data.data['access_token']));
        Navigator.push(
            event.context,
            MaterialPageRoute(
              builder: (context) => const AccountView(),
            ));
        emit(state.copyWith(isLoading: false));
      } catch (e) {
        log("message $e");
        emit(state.copyWith(error: e.toString()));
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
