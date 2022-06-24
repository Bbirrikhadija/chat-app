import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/screens/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class NewMessages extends StatefulWidget {
  const NewMessages({Key? key}) : super(key: key);

  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = TextEditingController();
  String _enterdMessage = "";
  String firstname = "";
  String lastname = "";

  _sendMessage() async {
    FocusScope.of(context).unfocus();  
    final user =  FirebaseAuth.instance.currentUser;
    final FirebaseAuth auth = FirebaseAuth.instance;

void inputData() {
  final User? user = auth.currentUser;
  final uid = user!.uid;
  // here you write the codes to input the data into firestore
}
    final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    FirebaseFirestore.instance.collection('chat').add({
            'text' : _enterdMessage,
            'createdAt': Timestamp.now(),
             'firstname' : firstname,
             'lastname' : lastname,
             'userId': user.uid,
             });
    //send ur msg here 
   _controller.clear();
  }
  final _auth = FirebaseAuth.instance;
  late User signedInUser;
  void initState(){
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser(){
    try{
      final user = _auth.currentUser;
      if(user!=null){
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: 
      Row(children:<Widget> [
        Expanded(child: TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'send message ', enabledBorder: UnderlineInputBorder(
borderSide: BorderSide(color: purpleapp),
),),
          
          onChanged: (value){
            setState(() {
              _enterdMessage = value;
              enabledBorder: UnderlineInputBorder(
borderSide: BorderSide(color: purpleapp),
);
            });
          },
          ),
          ),
          IconButton(
            color: purpleapp,
            icon: Icon(Icons.send),
         onPressed: () {
          enabledBorder: UnderlineInputBorder(
borderSide: BorderSide(color: purpleapp),
);
            if (_controller.text.trim().isNotEmpty) _sendMessage();
            enabledBorder: UnderlineInputBorder(
borderSide: BorderSide(color: purpleapp),
);
          }
          ),
      ],
      ),
    );
  }

}