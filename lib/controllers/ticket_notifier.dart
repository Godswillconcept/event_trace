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
  void updateTicket(Ticket updatedTicket) {
    final index = ticketList.indexWhere((ticket) => ticket.id == updatedTicket.id);
    if (index != -1) {
      ticketList[index] = updatedTicket;
      notifyListeners();
    }
  }

  // loading tickets from server into the provider
  TicketNotifier.all(List<Ticket> tickets) {
    ticketList = tickets;
    notifyListeners();
  }
}
