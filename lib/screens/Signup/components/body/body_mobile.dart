import 'dart:io';
import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chat_application/components/already_have_an_account_acheck.dart';
import 'package:chat_application/components/rounded_button.dart';
import 'package:chat_application/components/rounded_input_field.dart';
import 'package:chat_application/components/rounded_password_field.dart';
import 'package:chat_application/screens/Login/login_screen.dart';
import 'package:chat_application/screens/Signup/components/background.dart';
import 'package:chat_application/screens/Signup/components/or_divider.dart';
import 'package:chat_application/screens/Signup/components/social_icon.dart';
import 'package:flutter_svg/svg.dart';

class BodyMobile extends StatefulWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  _BodyMobileState createState() => _BodyMobileState();
}

class _BodyMobileState extends State<BodyMobile> {
  late File _pickedImage;
  @override
  Widget build(BuildContext context) {
  
    Size size = MediaQuery.of(context).size;
    var _pickedImage;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.22,
            ),
            Stack(
              children: [
                Container(margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child:  CircleAvatar( radius: 71,
                  backgroundColor: Colors.grey[100],
                  child :  CircleAvatar(
                    radius: 65,
                    backgroundImage: _pickedImage == null ? null : FileImage(_pickedImage),
                    ),
                  
                  ), ), 
                Positioned(
                  top: 120,
                  left: 120,
                child: RawMaterialButton(
                  elevation: 10,
                  fillColor: Colors.white,
                  child: Icon(Icons.add_a_photo),
                  padding: EdgeInsets.all(15),
                  shape: CircleBorder(),
                  onPressed: () {
                    showDialog(context: context, builder: (BuildContext){
                      return AlertDialog(
                        title: Text(
                          'Choose option',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        content: SingleChildScrollView(
                        child: ListBody(children: [
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.purple,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.camera,
                                color: purpleapp,
                              ),
                                ),
                                Text("Camera", style:  TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: purpleapp,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.image,
                                color: purpleapp,
                              ),
                                ),
                                Text("Galery", style:  TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      );
                    });
                  },

                )
                )
              ],
            ),
            RoundedInputField(
              hintText: "First name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Last name",
              onChanged: (value) {},
            ),
          
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
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
      ),
    );
  }
}
