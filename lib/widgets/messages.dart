import 'dart:html';

import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../models/messages.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final List messages = [
    {'senderProfile' : 'assets/images/user1.jpg',
      'senderName': 'Khadija',
      'message' : 'Hello ! Beautiful people, Hope you doing well ?',
      'unRead' : 0,
      'date' : '16:45',

    },
     {'senderProfile' : 'assets/images/user1.jpg',
      'senderName': 'Laila',
      'message' : 'Hello ! Beautiful people, Hope you doing well ?',
      'unRead' : 2,
      'date' : '17:00',

    },
     {'senderProfile' : 'assets/images/user1.jpg',
      'senderName': 'Mohammed',
      'message' : 'Hello ! Beautiful people, Hope you doing well ?',
      'unRead' : 3,
      'date' : '17:09',

    },
     {'senderProfile' : 'assets/images/user1.jpg',
      'senderName': 'Fadwa',
      'message' : 'Hello ! Beautiful people, Hope you doing well ?',
      'unRead' : 4,
      'date' : '18:06',

    },
  ];

   @override
  Widget build (BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: 
        messages.map((message){
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
              },
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 10, top: 15),
                child: Row(children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      color: purpleapp,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(message['senderProfile']),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(message['senderName'],
                              style: GoogleFonts.inter(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    message['message'],
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              )
                              
                            ],
                          ),
                          Column(
                            children: [
                              Text(message['date']),
                              message['unRead'] != 0 ? 
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: purpleapp,
                                  shape: BoxShape.circle,
                                ),
                              child:
                              Text(message['unRead'].toString(),
                              style: GoogleFonts.inter(
                                color:Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                               ),
                               )
                               : Container()
                              
                            ],
                          )
                        ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Colors.grey[400],
                          height: 0.5,
                        )
                      ],))
                ]),
              ),
            );
        }).toList()
      ,)
    );
    
  }
}
