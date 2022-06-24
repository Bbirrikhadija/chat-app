import 'package:chat_application/models/messages.dart';
import 'package:chat_application/widgets/chat/messagebubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {


  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}
class _ChatState extends State<Chat>{
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(

        stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: true).snapshots(),
        builder: (ctx, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          final docs = snapshot.data!.docs;
          final user =  FirebaseAuth.instance.currentUser;
          return ListView.builder(
            reverse: true,
            itemCount: docs.length,
          itemBuilder: (ctx, index) => MessageBubble(
            docs[index]['text'],
            docs[index]['firstname'],
            docs[index]['lastname'],
            docs[index]['userId'] == user!.uid,
            key: ValueKey('senderhfjh'),
          ),
          );
        }
      );
  }
}