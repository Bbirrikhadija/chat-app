import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/widgets/chat/new-message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/chat/messagescreen.dart';

class ChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleapp,
        title: Text('Friend chat'),
        actions: [
          DropdownButton(icon: Icon(Icons.more_vert, color:Theme.of(context).primaryIconTheme.color,), items: null, onChanged: null,)
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Chat(),
    ),
    NewMessages(),
          ],
        ),
      ),
      );

    
  }
}