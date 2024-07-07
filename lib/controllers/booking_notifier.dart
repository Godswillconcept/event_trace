import 'package:event_trace/models/Booking.dart';
import 'package:flutter/material.dart';

class BookingNotifier extends ChangeNotifier {
  List<Booking> bookingList = [];

  // adding booking
  addBooking(Booking booking) {
    bookingList.add(booking);
    notifyListeners();
  }

  // removing booking
  removeBooking(Booking booking) {
    bookingList.remove(booking);
    notifyListeners();
  }

  // updating booking
  updateBooking(Booking booking) {
    bookingList[bookingList.indexOf(booking)] = booking;
    notifyListeners();
  }

  // loading bookings from server into the provider
  BookingNotifier.all(List<Booking> bookings) {
    bookingList = bookings;
    notifyListeners();
  }
}
