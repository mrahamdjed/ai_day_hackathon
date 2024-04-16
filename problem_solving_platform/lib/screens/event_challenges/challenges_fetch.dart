
import 'package:flutter/material.dart';
import 'package:problem_solving_platform/backend/challenges/challenges_repository/model/challenges_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChallengesFetchProvider extends ChangeNotifier{

  ChallengesFetchProvider(String eventId){
    setChallenges(eventId);
  }
  
  List<ChallengesModel> challenges =[];
  int? score;

  static SupabaseClient supabaseClient = Supabase.instance.client;


  Future<void> setChallenges(String eventId) async {
    try {
 
      final List<Map<String, dynamic>> response = await supabaseClient.from('challenge')
      .select('challenge_id,challenge_name,challenge_discreption,challenge_score,event_id')
      .eq('event_id',eventId);

      final List<ChallengesModel> list=[];

      for(Map<String,dynamic> map in response){
        list.add(ChallengesModel.fromMap(map));
      }

      challenges=list;
      notifyListeners();

    } catch (e) {
      print("[[[[[[[[[[[[[[[[[[  EMPTY CHALLENGES ERROR  ]]]]]]]]]]]]]]]]]]");
    }
  
  }

  Future<void> getScore(bool isTeam,String id,String eventId)async{
    
    if(isTeam){
      final List<Map<String, dynamic>> response = await supabaseClient.from('event_join_team')
      .select('score').eq('event_id',eventId).eq("team_id", id);
      score = response[0]["score"];
      notifyListeners();
    }else{
      final List<Map<String, dynamic>> response = await supabaseClient.from('event_join_single')
      .select('score').eq('event_id',eventId).eq("user_id", id);
      score = response[0]["score"];
      notifyListeners();
    }
  }
}