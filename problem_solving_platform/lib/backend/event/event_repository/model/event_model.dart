import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EventModel{

  final String event_id;
  final String event_name;
  final String event_discreption;
  final String start_at;
  final String end_at;
  final String start_date;
  final String end_date;

  const EventModel({
    required this.event_id,
    required this.event_name,
    required this.event_discreption,
    required this.start_at,
    required this.end_at,
    required this.start_date,
    required this.end_date,
  });

  // Map<String,dynamic> toMap(){
  //   return {
  //     "user_id": id,
  //     "username": username,
  //     "email": email,
  //     "password": password
  //   };
  // }

  static EventModel fromMap(Map eventMap){
    print("[[[[[[[[[[[[[[[[[[[[[[[[[[ }}}}}}}}}}}}}}}}}}");
    return EventModel(
      event_id: eventMap["event_id"],
      event_name: eventMap["event_name"] as String, 
      event_discreption: eventMap["event_discreption"] as String, 
      start_at: eventMap["start_at"], 
      end_at: eventMap["end_at"], 
      start_date: eventMap["start_date"], 
      end_date: eventMap["end_date"]
    );
  }

}