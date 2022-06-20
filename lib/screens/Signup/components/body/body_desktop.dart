import 'dart:io';

import 'package:chat_application/components/already_have_an_account_acheck.dart';
import 'package:chat_application/components/rounded_button.dart';
import 'package:chat_application/components/rounded_input_field.dart';
import 'package:chat_application/components/rounded_password_field.dart';
import 'package:chat_application/responsive/responsive.dart';
import 'package:chat_application/screens/Login/login_screen.dart';
import 'package:chat_application/screens/Signup/components/background.dart';
import 'package:chat_application/screens/Signup/components/or_divider.dart';
import 'package:chat_application/screens/Signup/components/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyDesktop extends StatefulWidget {
  const BodyDesktop({Key? key}) : super(key: key);

  @override
  _BodyDesktopState createState() => _BodyDesktopState();
}

class _BodyDesktopState extends State<BodyDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context)
              ? size.width * 0.12
              : size.width * 0.07,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: Responsive.isDesktop(context) ? 2 : 1,
              child: SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.5,
              ),
            ),
             Stack(
              children: [
                Container(margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child:  CircleAvatar( radius: 71,
                  backgroundColor: Colors.grey,
                  child :  ClipOval(
                   child: SizedBox(
                    width: 180.0 ,
                    height: 180.0,
                    child:
                     Image.network("https://www.salisburyjournal.co.uk/news/19442721.salisbury-camera-club-5-colourful-pictures-taken/", fit: BoxFit.fill,),
                   ),
                  ), ) ),
                  Padding( padding: EdgeInsets.only(top: 60),
                  child: IconButton(icon: Icon(
                  Icons.camera_alt_rounded,
                  size: 30,), onPressed: () {  },

                  
                  ),
                  ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () {},
                    height: size.height * 0.07,
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
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
