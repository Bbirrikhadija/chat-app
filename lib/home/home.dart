import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/widgets/messages.dart';
import 'package:chat_application/widgets/recent_contacts.dart';
import 'package:flutter/material.dart';
import '../screens/profile.dart';
import '../constants/colors.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List _children = [
    HomePage(),
    Text('Hello friends!'),
    Profile(),
  ];

  static get imagePath => null;
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: kprimary,

      body:
        Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top),


        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text('Friend chat',
            style : TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28
            ), ),
          ),
            _children[_currentIndex],
            RecentContacts(),
            Messages(),
          ],

        ),

      ),
      bottomNavigationBar:
      BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple[300],
        showUnselectedLabels: false, items: [
        BottomNavigationBarItem(
            icon: Icon(
                Icons.message_rounded),
            label: 'Chats'),
        BottomNavigationBarItem(
            icon: Icon(
                Icons.people_outlined),
            label: 'Friends'),
        BottomNavigationBarItem(
            icon: Icon(
                Icons.person_outlined),
            label: 'Profile'
        )
      ],
      ),
    );
  }


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

