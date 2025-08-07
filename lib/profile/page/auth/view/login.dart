import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/profile/page/auth/bloc/auth/auth_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Email"),
            controller: emailC,
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Password"),
            controller: passC,
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(onPressed: () {
            context
                .read<AuthBloc>()
                .add(LoginEvent(email: emailC.text, password: passC.text, context: context));
          }, child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.isLoading == true) {
                return const Text("Loading");
              } else {
                return const Text("Login");
              }
            },
          ))
        ],
      ),
    );
  }
}
