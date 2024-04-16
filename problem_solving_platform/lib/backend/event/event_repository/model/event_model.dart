import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EventModel extends Equatable{

  final String event_id;
  final String event_name;
  final String event_discreption;
  final TimeOfDay start_at;
  final TimeOfDay end_at;
  final DateTime start_date;
  final DateTime end_date;

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
    return EventModel(
      event_id: eventMap["event_id"],
      event_name: eventMap["event_name"], 
      event_discreption: eventMap["event_discreption"], 
      start_at: eventMap["start_at"], 
      end_at: eventMap["end_at"], 
      start_date: eventMap["start_date"], 
      end_date: eventMap["end_date"]
    );
  }
   
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}