import 'package:event_trace/controllers/ticket_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  Widget build(BuildContext context) {
    void openDrawer() {
      Scaffold.of(context).openDrawer();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: openDrawer,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text(
          'Tickets',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ],
      ),
      body: Consumer<TicketNotifier>(
        builder: (context, ticketNotifier, child) {
          final tickets = ticketNotifier.ticketList.reversed.toList();
          return ListView.builder(
            itemCount: ticketNotifier.ticketList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                 
                  title: Text(
                    tickets[index].name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tickets[index].event!.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Quantity: ${tickets[index].quantity}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Price: ${tickets[index].price}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.event_seat),
                    onPressed: () {},
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
