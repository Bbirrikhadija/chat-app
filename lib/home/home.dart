import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/widgets/messages.dart';
import 'package:chat_application/widgets/recent_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../screens/profile.dart';
import '../constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  late int _currentIndex;

  @override
  Widget build (BuildContext context){
    const String page1 = "Chats";
    const String page2 = "Friends";
    const String page3 = "Profile";
    const String title = "Demo";     
    return Scaffold(
      backgroundColor: Colors.white,

      body:
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top),


          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child:
            
            Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text('Friend chat',
            style : TextStyle(
              color: kprimary,
              fontWeight: FontWeight.bold,
              fontSize: 28
            ), ),
            ),
          ),
            RecentContacts(),
            Messages(),
          ],

        ),

      ),
      floatingActionButton: 
      FloatingActionButton(
        onPressed: () {}, 
        backgroundColor: purpleapp,
          child: const Icon( Icons.edit,
          size: 20,), ),
      bottomNavigationBar:
      BottomNavigationBar(

        
        selectedItemColor: Colors.deepPurple[300],
        showUnselectedLabels: false, items: const [
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
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              _navigationItemListTitle(page1, 0),
              _navigationItemListTitle(page2, 1),
              _navigationItemListTitle(page3, 2),
            ],
          ),
        ),
      ),
    );
  }
Widget _navigationItemListTitle(String title, int index) {
  return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
      ),
    );
  }
}
