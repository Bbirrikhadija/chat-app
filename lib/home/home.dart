import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/widgets/messages.dart';
import 'package:chat_application/widgets/recent_contacts.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    Center(child: HomePage()),
    Center(child: Text('Friends')),
    Center(child: Text('Profile')),
  ];
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: KPrimary,

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

            RecentContacts(),
            Messages(),
          ],

        ),

      ),
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
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
}

