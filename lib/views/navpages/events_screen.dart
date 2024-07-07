// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:event_trace/models/Event.dart';
import 'package:event_trace/views/components/detail_screen.dart';
import 'package:event_trace/views/utils/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:provider/provider.dart';

import 'package:event_trace/constants/app_colors.dart';
import 'package:event_trace/constants/app_methods.dart';
import 'package:event_trace/controllers/event_notifier.dart';
import 'package:event_trace/views/utils/dynamic_button.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  void openDrawer() {
    Scaffold.of(context).openDrawer();
  }

  String _selectedSegment = 'upcoming';

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          'Events',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Color(0xff9B9B9B).withOpacity(0.3),
            ),
            child: Row(
              children: [
                Expanded(child: _buildButton("upcoming", "Upcoming")),
                Expanded(child: _buildButton("past_events", "Past Events")),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _buildContainer(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonName, String buttonText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSegment = buttonName;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _selectedSegment == buttonName
              ? Theme.of(context).colorScheme.inversePrimary
              : null,
          borderRadius:
              _selectedSegment == buttonName ? BorderRadius.circular(20) : null,
        ),
        child: Text(
          buttonText.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _selectedSegment == buttonName
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContainer() {
    switch (_selectedSegment) {
      case "upcoming":
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: Consumer<EventNotifier>(
            builder: (context, eventNotifier, child) {
              final eventCollection = List<Event>.from(eventNotifier.eventList);

              return ListView.separated(
                itemCount: eventCollection.length,
                padding: EdgeInsets.symmetric(horizontal: 20),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  final event = eventCollection[i];
                  return Column(
                    children: [
                      EventCard(
                        name: event.name,
                        day: dateFormatter(event.dateTime, "d"),
                        month: dateFormatter(event.dateTime, "MMM"),
                        image: event.photos!.isNotEmpty
                            ? imageUrl(event.photos!.last)
                            : "https://picsum.photos/seed/picsum/200",
                        location: event.venue != null ? event.venue!.name : '',
                        iconClick: () {
                          triggerToast(
                            context,
                            "${event.name} added to bookmark",
                            appGreen,
                            Theme.of(context).colorScheme.inversePrimary,
                            FlutterToastr.top,
                          );
                        },
                        cardClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailScreen(event: event);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              );
            },
          ),
        );

      case "past_events":
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // This is placeholder for illustration image
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/no-event.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.calendar_today,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  Text(
                    'No Upcoming Event',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              DynamicButton(buttonText: "EXPLORE EVENTS", onTap: () {}),
            ],
          ),
        );

      default:
        return Container();
    }
  }
}
