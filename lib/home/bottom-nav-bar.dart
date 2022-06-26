import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/home/home.dart';
import 'package:chat_application/widgets/chat/messagescreen.dart';
import 'package:chat_application/widgets/recent_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../screens/profile.dart';
import '../constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex=0;

  void _navigationBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List <Widget>_screens=[HomePage(),Text('Hello beautiful people!'),Profile(),];

  @override
  Widget build (BuildContext context){   
    return Scaffold(
      
      backgroundColor: Colors.white,
      body:
      _screens[_selectedIndex],
      bottomNavigationBar:
      BottomNavigationBar(
           currentIndex: _selectedIndex,
        onTap: _navigationBottomBar,
        selectedItemColor: Colors.deepPurple[300],
        showUnselectedLabels: false, items: const [
        BottomNavigationBarItem(
            icon: Icon(
                Icons.message_rounded),
            label: 'Chats'),
        BottomNavigationBarItem(
            icon: Icon(
                Icons.person_outlined),
            label: 'Profile'
        ),
        ],
        ),
    );
  }
}