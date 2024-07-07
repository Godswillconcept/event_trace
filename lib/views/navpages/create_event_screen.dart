import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
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
          'Create New Event',
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
      body: const Text('Create Event'),
    );
  }
}


    //  body: Column(
    //     children: [
    //       LinearProgressIndicator(
    //         value: (_currentIndex + 1) / 5,
    //         backgroundColor: Colors.grey[300],
    //         valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
    //       ),
    //       const SizedBox(height: 20),
    //       Text(
    //         'Step ${_currentIndex + 1} of 5',
    //         style: const TextStyle(
    //           fontSize: 18,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       Expanded(
    //         child: PageView(
    //           controller: _pageController,
    //           onPageChanged: (index) {
    //             setState(() {
    //               _currentIndex = index;
    //             });
    //           },
    //           children: _buildPages(),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             if (_currentIndex > 0)
    //               ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Theme.of(context).colorScheme.error,
    //                   foregroundColor:
    //                       Theme.of(context).colorScheme.inversePrimary,
    //                   shape: StadiumBorder(),
    //                 ),
    //                 onPressed: () {
    //                   _pageController.previousPage(
    //                     duration: Duration(milliseconds: 300),
    //                     curve: Curves.easeInOut,
    //                   );
    //                 },
    //                 child: const Text('Back'),
    //               ),
    //             if (_currentIndex < 4)
    //               ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Theme.of(context).colorScheme.primary,
    //                   foregroundColor:
    //                       Theme.of(context).colorScheme.inversePrimary,
    //                   shape: StadiumBorder(),
    //                 ),
    //                 onPressed: () {
    //                   _pageController.nextPage(
    //                     duration: Duration(milliseconds: 300),
    //                     curve: Curves.easeInOut,
    //                   );
    //                 },
    //                 child: const Text('Next'),
    //               ),
    //             if (_currentIndex == 4)
    //               ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Theme.of(context).colorScheme.primary,
    //                   foregroundColor:
    //                       Theme.of(context).colorScheme.inversePrimary,
    //                   shape: StadiumBorder(),
    //                 ),
    //                 onPressed: () {
    //                   // Submit the form or perform the final action
    //                 },
    //                 child: const Text('Finish'),
    //               ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
   
   