import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:event_trace/views/addons/events/event_faqs.dart';
import 'package:event_trace/views/addons/events/event_images.dart';
import 'package:event_trace/views/addons/events/event_tickets.dart';
import 'package:event_trace/views/addons/events/promote_event.dart';
import 'package:event_trace/views/navpages/create_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:event_trace/controllers/booking_notifier.dart';
import 'package:event_trace/controllers/category_notifier.dart';
import 'package:event_trace/controllers/event_notifier.dart';
import 'package:event_trace/controllers/faq_notifier.dart';
import 'package:event_trace/controllers/promotion_notifier.dart';
import 'package:event_trace/controllers/ticket_notifier.dart';
import 'package:event_trace/controllers/user_notifier.dart';
import 'package:event_trace/controllers/venue_notifier.dart';
import 'package:event_trace/models/Booking.dart';
import 'package:event_trace/models/Category.dart';
import 'package:event_trace/models/Event.dart';
import 'package:event_trace/models/Faq.dart';
import 'package:event_trace/models/Promotion.dart';
import 'package:event_trace/models/Ticket.dart';
import 'package:event_trace/models/User.dart';
import 'package:event_trace/models/Venue.dart';
import 'package:event_trace/services/request.dart';
import 'package:event_trace/theme/theme_provider.dart';
import 'package:event_trace/views/addons/bookmark_screen.dart';
import 'package:event_trace/views/addons/edit_profile_screen.dart';
import 'package:event_trace/views/addons/help_screen.dart';
import 'package:event_trace/views/addons/notification_screen.dart';
import 'package:event_trace/views/addons/search_screen.dart';
import 'package:event_trace/views/addons/setting_screen.dart';
import 'package:event_trace/views/auth/password_reset_screen.dart';
import 'package:event_trace/views/auth/verification_screen.dart';
import 'package:event_trace/views/components/introduction_screen.dart';
import 'package:event_trace/views/components/onboarding_screen.dart';
import 'package:event_trace/views/components/splash_screen.dart';
import 'package:event_trace/views/navpages/profile_screen.dart';
import 'package:event_trace/views/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // List of futures for all the requests
  var futures = [
    getRequest('bookings', null),
    getRequest('categories', null),
    getRequest('events', null),
    getRequest('faqs', null),
    getRequest('promotions', null),
    getRequest('tickets', null),
    getRequest('users', null),
    getRequest('venues', null),
  ];

  // Await all the futures
  var responses = await Future.wait(futures);

  // Process the responses
  var bookingResponse = responses[0];
  List<Booking> bookingList = [];
  List bookingData = bookingResponse.data['bookings'];
  for (var booking in bookingData) {
    bookingList.add(Booking.fromMap(booking));
  }

  var categoryResponse = responses[1];
  List<Category> categoryList = [];
  List categoryData = categoryResponse.data['categories'];
  for (var category in categoryData) {
    categoryList.add(Category.fromMap(category));
  }

  var eventResponse = responses[2];
  List<Event> eventList = [];
  List eventData = eventResponse.data['events'];
  for (var event in eventData) {
    eventList.add(Event.fromMap(event));
  }

  var faqResponse = responses[3];
  List<Faq> faqList = [];
  List faqData = faqResponse.data['faqs'];
  for (var faq in faqData) {
    faqList.add(Faq.fromMap(faq));
  }

  var promotionResponse = responses[4];
  List<Promotion> promotionList = [];
  List promotionData = promotionResponse.data['promotions'];
  for (var promotion in promotionData) {
    promotionList.add(Promotion.fromMap(promotion));
  }

  var ticketResponse = responses[5];
  List<Ticket> ticketList = [];
  List ticketData = ticketResponse.data['tickets'];
  for (var ticket in ticketData) {
    ticketList.add(Ticket.fromMap(ticket));
  }

  var userResponse = responses[6];
  List<User> userList = [];
  List userData = userResponse.data['users'];
  for (var user in userData) {
    userList.add(User.fromMap(user));
  }

  var venueResponse = responses[7];
  List<Venue> venueList = [];
  List venueData = venueResponse.data['venues'];
  for (var venue in venueData) {
    venueList.add(Venue.fromMap(venue));
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => BookingNotifier.all(bookingList)),
      ChangeNotifierProvider(
          create: (context) => CategoryNotifier.all(categoryList)),
      ChangeNotifierProvider(create: (context) => EventNotifier.all(eventList)),
      ChangeNotifierProvider(create: (context) => FaqNotifier.all(faqList)),
      ChangeNotifierProvider(
          create: (context) => PromotionNotifier.all(promotionList)),
      ChangeNotifierProvider(
          create: (context) => TicketNotifier.all(ticketList)),
      ChangeNotifierProvider(create: (context) => UserNotifier.all(userList)),
      ChangeNotifierProvider(create: (context) => VenueNotifier.all(venueList)),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: AnimatedSplashScreen(
        splash: const SplashScreen(),
        nextScreen: const OnboardingScreen(),
        duration: 4000,
        curve: Curves.easeInOut,
      ),
      routes: {
        // '/login': (context) => const SigninScreen(),
        // '/register': (context) => const SignupScreen(),
        '/verify': (context) => const VerificationScreen(),
        '/reset': (context) => const PasswordResetScreen(),
        '/start': (context) => const StartScreen(),
        '/search': (context) => const SearchScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/bookmark': (context) => const BookmarkScreen(),
        '/settings': (context) => const SettingScreen(),
        '/help': (context) => const HelpScreen(),
        '/intro': (context) => const IntroductionScreen(),
        '/create_event': (context) => const CreateEventScreen(),
        '/add_images': (context) => const EventImages(),
        '/add_ticket': (context) => const EventTickets(),
        '/add_faq': (context) => const EventFaqs(),
        '/event_promotion': (context) => const PromoteEvent(),
      },
    );
  }
}
