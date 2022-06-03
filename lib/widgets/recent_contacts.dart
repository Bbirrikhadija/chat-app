import 'package:flutter/material.dart';
import '../models/user.dart';
class RecentContacts extends StatelessWidget{
  final contactList = User.generateUsers();
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      padding:  EdgeInsets.only(left: 25),
      height: 50,
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
                        color: Colors.yellow,
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