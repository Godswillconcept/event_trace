import 'package:event_trace/models/Ticket.dart';
import 'package:flutter/material.dart';

class TicketNotifier extends ChangeNotifier {
  List<Ticket> ticketList = [];

  // adding ticket
  addTicket(Ticket ticket) {
    ticketList.add(ticket);
    notifyListeners();
  }

  // removing ticket
  removeTicket(Ticket ticket) {
    ticketList.remove(ticket);
    notifyListeners();
  }

  // updating ticket
  updateTicket(Ticket ticket) {
    ticketList[ticketList.indexOf(ticket)] = ticket;
    notifyListeners();
  }

  // loading tickets from server into the provider
  TicketNotifier.all(List<Ticket> tickets) {
    ticketList = tickets;
    notifyListeners();
  }
}
