import 'package:chat_application/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageBubble extends StatelessWidget {
MessageBubble(this.message, this.firstname, this.lastname,this.isMe, {required this.key});
final Key key;
final String message;
final String firstname;
final String lastname;
final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
      Container(
        decoration: 
        BoxDecoration(
          color : isMe ? Colors.grey[300]: purpleapp,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(14),
            bottomRight: isMe ? Radius.circular(0) : Radius.circular(14),

          ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment: 
            isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(''),
              Text(message,
              style: TextStyle(
                color: isMe ? Colors.black : Colors.white,
              ),
              textAlign: isMe ? TextAlign.end: TextAlign.start,)
            ],
          ),
      ),

      ],
    );
    
  }
}