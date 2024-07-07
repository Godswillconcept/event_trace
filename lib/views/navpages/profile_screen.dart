// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:event_trace/constants/app_data.dart';
import 'package:event_trace/models/User.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  void openDrawer() {
    Scaffold.of(context).openDrawer();
  }

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
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Profile ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Airbnb Cereal App",
            fontSize: 24,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  backgroundImage: AssetImage('assets/images/member-02.png'),
                ),
              ),
              Text(
                user!.name!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '350',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 1,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  Column(
                    children: [
                      Text(
                        '346',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Follower',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                icon: Icon(
                  Icons.edit_square,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    minimumSize: Size(150, 50)),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Hi there, I'm ${user!.name}! I'm a software developer with a for creating beautiful anditive user experiences. I'm always looking for new challenges and opportunities to grow and learn. ",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: 'Read More',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Interest',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    label: Text("CHANGE"),
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                    avatar: Icon(
                      Icons.edit_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: List.generate(
                  interestCollection.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Chip(
                      backgroundColor: interestCollection[index]['color'],
                      label: Text(
                        interestCollection[index]['name'],
                      ),
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
