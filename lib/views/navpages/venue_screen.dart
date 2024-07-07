// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_trace/constants/app_methods.dart';
import 'package:event_trace/controllers/venue_notifier.dart';
import 'package:event_trace/models/User.dart';
import 'package:event_trace/models/Venue.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

// class VenueScreen extends StatefulWidget {
//   const VenueScreen({Key? key}) : super(key: key);

//   @override
//   _VenueScreenState createState() => _VenueScreenState();
// }

// class _VenueScreenState extends State<VenueScreen> {
//   String? token;
//   User? user;

//   @override
//   void initState() {
//     super.initState();

//     final LocalStorage tokenStorage = LocalStorage('token');
//     final LocalStorage userStorage = LocalStorage('user');

//     var tokenData = tokenStorage.getItem('token');
//     if (tokenData != null) {
//       token = tokenData.toString();
//     }
//     var userData = userStorage.getItem('user');
//     if (userData != null) {
//       user = User.fromJson(userData);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final venueList = Provider.of<VenueNotifier>(context).venueList;
//   // Venue findVenueById(int ownerId) {
//   //   return venueList.firstWhere(
//   //     (venue) => venue.ownerId == ownerId,
//   //   );
//   // }
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       body: Consumer<VenueNotifier>(
//         builder: (context, venueNotifier, child) {
//           // var venue = findVenueById(user!.id);
//           return ListView(
//             children: [
//               CarouselSlider(
//                 options: CarouselOptions(
//                   aspectRatio: 16 / 9,
//                   viewportFraction: 1.0,
//                   initialPage: 0,
//                   enableInfiniteScroll: true,
//                   reverse: false,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enlargeCenterPage: true,
//                   scrollDirection: Axis.horizontal,
//                 ),
//                 items: [
//                   Image.network(
//                     venueNotifier.venue?.venueImageUrl ??
//                         'https://source.unsplash.com/random/800x300',
//                     fit: BoxFit.cover,
//                   ),
//                   Image.network(
//                     venueNotifier.venue?.venueImageUrl2 ??
//                         'https://picsum.photos/800/375?random',
//                     fit: BoxFit.cover,
//                   ),
//                   Image.network(
//                     venueNotifier.venue?.venueImageUrl3 ??
//                         'https://picsum.photos/800/300',
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       notifier.venue?.venueName ?? 'The Venue Name',
//                       style: Theme.of(context).textTheme.headline5,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15.0),
//                       child: Text(
//                         notifier.venue?.venueDescription ??
//                             'The Venue Description',
//                         style: Theme.of(context).textTheme.bodyText1,
//                       ),
//     );
//   }
// }

class VenueScreen extends StatefulWidget {
  const VenueScreen({Key? key}) : super(key: key);

  @override
  _VenueScreenState createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  User? user;

  @override
  void initState() {
    super.initState();

    final LocalStorage userStorage = LocalStorage('user');

    var userData = userStorage.getItem('user');
    if (userData != null) {
      user = User.fromJson(userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final List<Venue> venueList = Provider.of<VenueNotifier>(context).venueList;
    void openDrawer() {
      Scaffold.of(context).openDrawer();
    }

    final venue = venueList.first;

    List<String> venuePhotos = List<String>.from(jsonDecode(venue.photos!));
    List imageUrls = venuePhotos;

    List<Widget> carouselItems = imageUrls.map((url) {
      return Image.network(
        imageUrl(url),
        fit: BoxFit.cover,
        width: double.maxFinite,
      );
    }).toList();
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
          'Venue Screen',
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
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: carouselItems,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  venue.name,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    venue.description!,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.location_on),
                  title: Text(venue.address!),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.phone),
                  title: Text(venue.phone),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.email),
                  title: Text(venue.email!),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.public),
                  title: Text(venue.website!),
                ),
                Text(
                  'Past Events:',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: venue.events!.length,
                  itemBuilder: (context, i) => ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              imageUrl(venue.events![i].photos!.first!)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(venue.events![i].name),
                    subtitle: Text(
                        dateFormatter(venue.events![i].dateTime, "d MMMM y") +
                            '\n' +
                            dateFormatter(
                                venue.events![i].dateTime, "EEEE, h:mm a")),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
