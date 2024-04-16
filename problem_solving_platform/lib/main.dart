import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/user_repository/user_repository.dart';
import 'package:problem_solving_platform/screens/landing/landing_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


const supabaseUrl = 'https://nmgzzddfgutirdpmksfc.supabase.co';
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5tZ3p6ZGRmZ3V0aXJkcG1rc2ZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMyMDgxMDAsImV4cCI6MjAyODc4NDEwMH0.o0HDqmEJ3US9tyqgqNym6xMCMWohuEIKJ_2f7xAZUKY";

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserRepository>(
      create: (BuildContext context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            AuthenticationBloc(RepositoryProvider.of<UserRepository>(context)),
        child: MaterialApp(
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              print("=====================================${state.authenticationStatus}================");

              if(state.authenticationStatus != AuthenticationStatus.authenticated){
                return const LandingPage();
              }else{
                return const Center(
                  child: Text("Authen"),
                );
              }
            
            },
          ),
        ),
      ),
    );
  }
}
