import 'dart:async';

import 'package:problem_solving_platform/backend/my_user/user_repository/models/my_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {

  SupabaseClient supabaseClient = Supabase.instance.client;

  final StreamController<MyUserModel> userStream = StreamController<MyUserModel>();

  Future<MyUserModel> signIn(String email , String password) async {
    final auth = supabaseClient.auth;
    try {
      
      final AuthResponse response = await auth.signInWithPassword(email: email,password: password);
      
      final List userMap = await supabaseClient.from("my_user").select("*").filter("user_id", "eq", response.user!.id);

      final MyUserModel myUserModel = MyUserModel.fromMap(userMap[0]);

      userStream.add(myUserModel);

      print("[[[[[[[[[[[[[[[[[[ DONE $myUserModel ]]]]]]]]]]]]]]]]]]");
      return myUserModel;
    
    } catch (e) {
      print("[[[[[[[[[[[[[[[[[[ The Error ${e.toString()} ]]]]]]]]]]]]]]]]]]");
      userStream.add(MyUserModel.empty);
      return MyUserModel.empty;
    }
  }
}