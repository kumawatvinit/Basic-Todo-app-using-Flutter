import 'dart:convert';

import '../models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

// List<Event> globalEvenList = [];

class Appdata{
//  Access shared preferences
    //  0. Initialise shared pref
    //  1. Store data in shared pref
    //  2. get data from shared pref
//  Global list of events

  static List<Event> _eventList = [];
  static late SharedPreferences _sharedPreferences;
  static List<String> _jsonEventList = [];

//  late (keyword), no need to initialise static variables at declaration.

  static Future<void> initEvent() async {

    _sharedPreferences = await SharedPreferences.getInstance();

    final _tempJsonEventList = _sharedPreferences.getStringList('todoList');

  //  If data is already in your phone

    if(_tempJsonEventList != null){

      _jsonEventList = _tempJsonEventList;
      _eventList = _tempJsonEventList.map((e) => Event.fromJson(jsonDecode(e))).toList();
    }

  //  "{'name': 'Event 1', 'isCompleted': true}"
  //  jsonDecode: string -> Map<String, dynamic>
  //  Event.fromJson: Map<String, dynamic> -> Event object
  }

  static List<Event> getevents(){
    return _eventList;
  }
  static Future<void> addEvent(Event event) async{
    _eventList.add(event);
    _jsonEventList.add(jsonEncode(event));
    await _sharedPreferences.setStringList('todoList', _jsonEventList);

    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> saveEvents() async {
    _jsonEventList = _eventList.map((event) => jsonEncode(event)).toList();
    await _sharedPreferences.setStringList('todoList', _jsonEventList);
  }

  static Future<void> deleteEvent(int index) async{
    _eventList.removeAt(index);
    _jsonEventList.removeAt(index);
    await _sharedPreferences.setStringList('todoList', _jsonEventList);
  }

}