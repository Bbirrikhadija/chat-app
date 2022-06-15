import 'package:chat_application/constants/colors.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/messages.dart';
class Messages extends StatelessWidget {
  final messageList = Message.generateHomePageMessages();
  @override
  Widget build(BuildContext context){
    return Expanded(
       child:  Container(
         child: buildMessage(),
       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.only(
               topLeft: Radius.circular(30),
           topRight: Radius.circular(30))
         ),
    ),

    );
  }

  Widget buildMessage() {
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => buildMessages(index),
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 30),
        itemCount: messageList.length);
  }
  Widget buildMessages(int index){
    return Row(
      children: [
        Container(
        width: 55,
        height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
              image:
              DecorationImage(image: AssetImage(messageList[index].user.iconUrl))
          ),
      ),
        SizedBox(width: 10),
        Flexible(
            child: Column(
          children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   '${
                 messageList[index].user.firstName } ${messageList[index].user.lastName }'
                 , style: TextStyle(
                   fontSize: 16,
                   color:kprimarydark,
                   fontWeight: FontWeight.bold),
                 ),
                       Text(messageList[index].lastTime)],
             ),
             SizedBox(height: 5),
             Text(messageList[index].lastMessage,
            overflow: TextOverflow.ellipsis,)
          ],
          
        ),
        ),
        Container(
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            color: purpleapp,
            shape: BoxShape.circle,
          ),
          child: const Center(child: Text('1',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),)),
          
        )

    ],);
  }
}