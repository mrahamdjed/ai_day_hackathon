import 'package:flutter/material.dart';
import 'package:problem_solving_platform/backend/event/event_repository/event_repository.dart';
import 'package:problem_solving_platform/backend/event/event_repository/model/event_model.dart';

class EventProvider extends ChangeNotifier{
  
  Map<String,EventModel?> myEvents = {
    "next" : null,
    "prev" : null
  };

  List<EventModel> gettedEvents = [] ;


  void setEvents() async {
    List<EventModel> prev = await EventRepository.getTodayEvents()==[] ? await EventRepository.getPreviosEvents() : await EventRepository.getTodayEvents();
    List<EventModel> next = await EventRepository.getCommingEvents();
    myEvents["next"]= prev.isEmpty ? null : prev[0];
    myEvents["next"]= next.isEmpty ? null : next[0];
    notifyListeners();
  }

  Future<void> getPreviousEvents() async {
    final temp = await EventRepository.getPreviosEvents();
    gettedEvents = temp;
    notifyListeners();
  }

  Future<void> getTodayEvents() async {
    final temp = await EventRepository.getTodayEvents();
    gettedEvents = temp;
    notifyListeners();
  }

  Future<void> getCommingEvents() async {
    final temp = await EventRepository.getCommingEvents();
    gettedEvents = temp;
    notifyListeners();
  }

}