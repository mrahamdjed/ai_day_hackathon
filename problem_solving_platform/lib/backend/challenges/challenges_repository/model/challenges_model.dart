// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChallengesModel {
  final String challenge_id;
  final String challenge_name;
  final String challenge_discreption;
  final int challenge_score;
  final String event_id;

  ChallengesModel({
    required this.challenge_id, 
    required this.challenge_name, 
    required this.challenge_discreption, 
    required this.challenge_score, 
    required this.event_id});
    

  

  ChallengesModel copyWith({
    // String? challenge_id,
    String? challenge_name,
    String? challenge_discreption,
    int? challenge_score,
    // String? event_id,
  }) {
    return ChallengesModel(
      challenge_id: this.challenge_id,
      challenge_name: challenge_name ?? this.challenge_name,
      challenge_discreption: challenge_discreption ?? this.challenge_discreption,
      challenge_score: challenge_score ?? this.challenge_score,
      event_id: this.event_id,
    );
  }
}
