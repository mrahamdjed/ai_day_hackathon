import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameSingleRepository {
  
  static SupabaseClient _supabaseClient = Supabase.instance.client;
  
  static Future<void> joinSingleGame(String eventId,String userId) async {
      await _supabaseClient.from('event_join_single').insert({
        "user_id" : userId,
        "event_id" : eventId,
        "start_at" : '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}:00',
        "end_at" : '00:00:00',
        "score" : 0,
      });
      print("ADDED=====");
  }
  
  // Future<void> addInScore(String eventId,String userId,int addedScore)async{
  //   Map old =  (await supabaseClient.from('event_join_single').select('*').eq("user_id", userId).eq("event_id", eventId))[0];
  //   await supabaseClient.from('event_join_single').update({"score" : old["score"]+ addedScore }).eq("user_id", userId).eq("event_id", eventId);
  // }

}