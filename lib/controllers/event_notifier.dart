import 'package:event_trace/models/Event.dart';
import 'package:flutter/material.dart';

class EventNotifier extends ChangeNotifier {
  List<Event> eventList = [];
  String _slug = '';

  String get slug => _slug;

  void setSlug(String newSlug) {
    _slug = newSlug;
    notifyListeners();
  }

  // adding event
  addEvent(Event event) {
    eventList.add(event);
    notifyListeners();
  }

  // removing event
  removeEvent(Event event) {
    eventList.remove(event);
    notifyListeners();
  }

  // updating event
  updateEvent(Event event) {
    eventList[eventList.indexOf(event)] = event;
    notifyListeners();
  }

  // loading events from server into the provider
  EventNotifier.all(List<Event> events) {
    eventList = events;
    notifyListeners();
  }


}
