
import 'package:supabase_flutter/supabase_flutter.dart';

class ChallengesRepository{

  SupabaseClient supabaseClient = Supabase.instance.client;

  Future<void> addAnswer(String challenge_id,String answerUrl,String user_id) async {
    await supabaseClient.from('solved_by_single').insert({
        "user_id" : user_id,
        "challenge_id" : challenge_id,
        "solution" : answerUrl,
      });
  }
}