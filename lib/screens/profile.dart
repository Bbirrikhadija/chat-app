import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: purpleapp,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 16 , 20 , 10),
        child: Column(children: [
          Center(
            child: Stack(
              children:[ CircleAvatar(
                backgroundImage: AssetImage('assets/deepa.jpg'),
                radius: 90,
              ),
                Positioned(
                  right: 0,
                  bottom:0,
                  child: Icon(Icons.camera_alt_rounded,size: 40,color: purpleapp,),)
              ],
            ),
          ),
          SizedBox(height: 1.2),
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: ListTile(
                    leading: Icon(Icons.person,color: purpleapp,),
                    title: Text('Name'),
                    subtitle: Opacity(
                      opacity: 0.7,
                      child: Text(
                        'Deepa Pandey ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ),
                    trailing: Icon(Icons.edit),
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  indent: 65,
                  endIndent: 5,
                ),
                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: ListTile(
                    leading: Icon(Icons.info_outline_rounded,color: purpleapp,),
                    title: Text('About'),
                    subtitle: Opacity(
                      opacity: 0.7,
                      child: Text(
                        'Accustomed 🤕 wid coding 👨‍💻 & covid 🦠 ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ),
                    trailing: Icon(Icons.edit),
                    isThreeLine: true,
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  indent: 65,
                  endIndent: 5,
                ),
                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: ListTile(
                    leading: Icon(Icons.mail_outline,
                      color: purpleapp),
                    title: Text('Email'),
                    subtitle: Opacity(
                      opacity: 0.7,
                      child: Text(
                        'Bbirri@gmail.com ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ),
                    trailing: Icon(Icons.edit),
                    //isThreeLine: true,
                  ),
                ),
              ],
            ),
          )
        ],
        ),
      ),
    );
  }

}