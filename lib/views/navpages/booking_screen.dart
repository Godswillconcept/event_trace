import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({ Key? key }) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
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
          'Bookings',
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
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            leading: Icon(Icons.event_available, size: 40, color: Colors.green[400]),
            title: const Text('Event 1', style: TextStyle(fontSize: 18)),
            subtitle: Text(
              'Hosted by user1 on December 12, 2022 at 12:00 PM',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            trailing: const Text('\$10.00', style: TextStyle(fontSize: 18)),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            leading: Icon(Icons.event_available, size: 40, color: Colors.green[400]),
            title: const Text('Event 2', style: TextStyle(fontSize: 18)),
            subtitle: Text(
              'Hosted by user2 on December 12, 2022 at 1:00 PM',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            trailing: const Text('\$20.00', style: TextStyle(fontSize: 18)),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            leading: Icon(Icons.event_available, size: 40, color: Colors.green[400]),
            title: const Text('Event 3', style: TextStyle(fontSize: 18)),
            subtitle: Text(
              'Hosted by user3 on December 12, 2022 at 2:00 PM',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            trailing: const Text('\$30.00', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),


    );
  }
}