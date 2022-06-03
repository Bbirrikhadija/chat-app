import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/widgets/messages.dart';
import 'package:chat_application/widgets/recent_contacts.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: KPrimary,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text('Friend chat',
            style : TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28
            ), ),
          ),
            RecentContacts(),
            Messages()
          ],

        ),
      ),
      bottomNavigationBar:
      BottomNavigationBar(selectedItemColor: Colors.deepPurple[300], items: [
        BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: 'Messages'),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined), label: 'Friends'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined), label: 'Profile'),
      ]),
    );
  }
}