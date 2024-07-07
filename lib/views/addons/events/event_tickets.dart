import 'package:event_trace/controllers/event_notifier.dart';
import 'package:event_trace/views/utils/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventTickets extends StatefulWidget {
  const EventTickets({
    Key? key,
  }) : super(key: key);

  @override
  _EventTicketsState createState() => _EventTicketsState();
}

class _EventTicketsState extends State<EventTickets> {
  @override
  Widget build(BuildContext context) {
    final eventSlug = Provider.of<EventNotifier>(context).slug;
    return Column(
      children: [
        DynamicButton(
          buttonText: 'Attach tickets',
          onTap: () {},
        )
      ],
    );
  }
}
