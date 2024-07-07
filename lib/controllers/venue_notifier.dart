import 'package:event_trace/models/Venue.dart';
import 'package:flutter/material.dart';

class VenueNotifier extends ChangeNotifier {
  List<Venue> venueList = [];

  // find a user whose owner id is equal to the authenticated user
  

  // adding venue
  addVenue(Venue venue) {
    venueList.add(venue);
    notifyListeners();
  }

  // removing venue
  removeVenue(Venue venue) {
    venueList.remove(venue);
    notifyListeners();
  }

  // updating venue
  updateVenue(Venue venue) {
    venueList[venueList.indexOf(venue)] = venue;
    notifyListeners();
  }

  // loading venues from server into the provider
  VenueNotifier.all(List<Venue> venues) {
    venueList = venues;
    notifyListeners();
  }
}
