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

  static Future<void> joinTeamGame(String teamId) async {
      // await _supabaseClient.from('event_join_team').insert({
      //   "team_id" : teamId,
      //   "start_at" : '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}:00',
      //   "end_at" : '00:00:00',
      //   "score" : 0,
      // });
      print("ADDED=====");
  }

  static Future<bool> alreadyjoined(String userId,String eventId) async {
    // final List temp = await _supabaseClient.from('event_join_team').select('team_id').eq('user_id',userId);
    final List temp = await _supabaseClient.from('event_join_single').select('user_id').eq('user_id',userId).eq("event_id", eventId);
    if(temp.isEmpty){
      return false;
    }
    return true;
  }

  static Future<void> joinAndCreateTeamGame(String eventId,String userId,String teamName,String? discreption) async {
      
      await _supabaseClient.from('team').insert({
        "created_by_id" : userId,
        "team_name" : teamName,
        "team_discreption" : discreption ?? "",
        "score" : 0,
      });
      final String teamId = (await _supabaseClient.from('team').select('team_id').eq('created_by_id',userId).eq("team_name", teamName))[0]["team_id"];
      
      await _supabaseClient.from('event_join_team').insert({
        "event_id" : eventId,
        "team_id" : teamId,
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