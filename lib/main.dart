import 'dart:async';
import 'package:chat_application/home/home.dart';
import 'package:chat_application/screens/Login/login_screen.dart';
import 'package:chat_application/screens/Signup/signup_screen.dart';
import 'package:chat_application/screens/Welcome/welcome_screen.dart';
import 'package:chat_application/screens/chat.dart';
import 'package:chat_application/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
       initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'sign_screen': (context) => SignUpScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_page': (context) => HomePage()
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                WelcomeScreen(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        width: 500,
        color: Colors.white,
      child:
      Align(
        alignment: Alignment.center,
        child:
        Image(
        image: AssetImage('assets/images/logoapp.png',  ), height: 500,),
    ),
    );

  }
}

