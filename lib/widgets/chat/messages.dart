import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final List messages = [
    {'senderProfile' : 'assets/images/user22.jpg',
      'senderName': 'Anouar',
      'message' : ' what about u ?',
      'unRead' : 3,
      'date' : '9:00',

    }
     
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
                padding: EdgeInsets.only( right: 32, top: 10),
                child: Row(children: [
                  Container(
                    width: 52,
                    height: 52,
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
                              Padding(padding: EdgeInsets.only(left: 11)),
                              Text(message['senderName'],
                              
                              style: GoogleFonts.inter(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                
                              ),
                              
                              ),
                              Wrap(
                                children: [
                                  Padding(padding: EdgeInsets.only(right: 8)),
                                  Text(
                                    message['message'],
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: 11.6,
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