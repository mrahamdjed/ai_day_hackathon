import 'package:problem_solving_platform/backend/event/event_repository/model/event_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventRepository {
  
  static SupabaseClient supabaseClient = Supabase.instance.client;

  static Future<List<EventModel>> getTodayEvents()async{
    try {

      final List<Map<String, dynamic>> response = await supabaseClient.from('event').select('*').filter('start_date', 'eq', DateTime.parse('2024-04-16'));

      final List<EventModel> list=[];

      for(Map map in response){
        list.add(EventModel.fromMap(map));
      }
      return list;
    
    } catch (e) {
      print("[[[[[[[[[[[[[[[[[[  EMPTY TODAY EVENTS ERROR  ]]]]]]]]]]]]]]]]]]");
      return [];
    }
  }

  static Future<List<EventModel>> getPreviosEvents()async{
    try {

      final List<Map<String, dynamic>> response = await supabaseClient.from('event').select('*').gt('start_date',DateTime.parse('2024-04-16'));

      final List<EventModel> list=[];

      for(Map map in response){
        list.add(EventModel.fromMap(map));
      }
      return list;
    
    } catch (e) {
      print("[[[[[[[[[[[[[[[[[[  EMPTY PREVIOS EVENTS ERROR  ]]]]]]]]]]]]]]]]]]");
      return [];
    }
  }

  static Future<List<EventModel>> getCommingEvents()async{
    try {

      final List<Map<String, dynamic>> response = await supabaseClient.from('event').select('*').lt('start_date', DateTime.parse('2024-04-16'));

      final List<EventModel> list=[];

      for(Map map in response){
        list.add(EventModel.fromMap(map));
      }
      return list;
    
    } catch (e) {
      print("[[[[[[[[[[[[[[[[[[  EMPTY COMMING EVENTS ERROR  ]]]]]]]]]]]]]]]]]]");
      return [];
    }
  }

  
}