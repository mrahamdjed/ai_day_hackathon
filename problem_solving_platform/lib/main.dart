
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/user_repository/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://nmgzzddfgutirdpmksfc.supabase.co';
const supabaseKey = String.fromEnvironment(
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5tZ3p6ZGRmZ3V0aXJkcG1rc2ZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMyMDgxMDAsImV4cCI6MjAyODc4NDEwMH0.o0HDqmEJ3US9tyqgqNym6xMCMWohuEIKJ_2f7xAZUKY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5tZ3p6ZGRmZ3V0aXJkcG1rc2ZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMyMDgxMDAsImV4cCI6MjAyODc4NDEwMH0.o0HDqmEJ3US9tyqgqNym6xMCMWohuEIKJ_2f7xAZUKY');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final temp = UserRepository();
    return MaterialApp(
      home: BlocProvider(
        create: (_) => AuthenticationBloc(temp),
        child: BlocProvider(
          create: (context) => SignInBloc(temp),
          child: Scaffold(body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
                print("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[Authenticated-------------------------");
              if(state.authenticationStatus == AuthenticationStatus.authenticated ){
                return Text("Authen");
              }else{
                print("UnAuthenticated-------------------------");
                context.read<SignInBloc>().add(const SignInRequired("abcde25@gmail.com", "password"));
                return Text("UnAuthen");
              }
              return SizedBox();
            },
            
          )),
        ),
      ),
    );
  }
}
