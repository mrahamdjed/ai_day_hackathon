import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'challenge_id': challenge_id,
      'challenge_name': challenge_name,
      'challenge_discreption': challenge_discreption,
      'challenge_score': challenge_score,
      'event_id': event_id,
    };
  }

  factory ChallengesModel.fromMap(Map<String, dynamic> map) {
    return ChallengesModel(
      challenge_id: map['challenge_id'] as String,
      challenge_name: map['challenge_name'] as String,
      challenge_discreption: map['challenge_discreption'] as String,
      challenge_score: map['challenge_score'] as int,
      event_id: map['event_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChallengesModel.fromJson(String source) => ChallengesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
