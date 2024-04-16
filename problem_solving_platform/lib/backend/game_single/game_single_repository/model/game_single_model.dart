import 'package:flutter/material.dart';

class GameSingleModel{
  
  final String user_id;
  final String event_id;
  final TimeOfDay start_at;
  final TimeOfDay end_at;
  final int score;

  const GameSingleModel({required this.user_id,required this.event_id,required this.start_at,required this.end_at,required this.score});

  static GameSingleModel fromMap(Map joinMap){
    return GameSingleModel(
      user_id: joinMap['user_id'], 
      event_id: joinMap['event_id'], 
      start_at: joinMap['start_at'], 
      end_at: joinMap['end_at'],
      score: joinMap['score'] ,
    );
  }
}