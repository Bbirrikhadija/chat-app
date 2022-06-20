import 'package:chat_application/constants/colors.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class RecentContacts extends StatefulWidget {
  const RecentContacts({Key? key}) : super(key: key);

  @override
  _RecentContactsState createState() => _RecentContactsState();
}

class _RecentContactsState extends State<RecentContacts> {
  final contactList = User.generateUsers();
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      padding:  EdgeInsets.only(left: 25),
      color: kprimary,
      height:120,
      child: Row(
        children : [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color:  Colors.white.withOpacity(0.4), shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,),
          ),
          Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Container(
                    width: 55,
                    height: 55,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image:
                        DecorationImage(image: AssetImage(contactList[index].iconUrl))
                    ),
          ),
              separatorBuilder: (_, index) => SizedBox(width: 15),
              itemCount: contactList.length)
          )
        ]
      )
    );
  }
}