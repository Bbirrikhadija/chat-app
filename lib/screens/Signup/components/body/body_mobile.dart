import 'dart:io';
import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  final _auth = FirebaseAuth.instance;
  late String email;
  late String firstname;
  late String lastname;
  late String password;
  bool showSpinner = false;
  late File _pickedImage;
  final ImagePicker _picker = ImagePicker();
  final _globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  var _pickedImage;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child:  CircleAvatar( radius: 68,
                backgroundColor: Colors.grey,
                  child :  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 65,
                    ),
                   backgroundImage: _pickedImage == null ? null : FileImage(_pickedImage.path),
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
                            onTap: () {
                              pickImage(ImageSource.camera);
                            },
                            splashColor: Colors.black26,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.camera_alt_outlined,
                                color: Colors.black12,
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
                            onTap: () { 
                              pickImage(ImageSource.gallery);
                          },
                            splashColor: Colors.black38,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.image,
                                color: Colors.black12,
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
              onChanged: (value) {
                firstname = value;
              },
            ),
            RoundedInputField(
              hintText: "Last name",
              onChanged: (value) {
                lastname = value;
              },
            ),
          
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, 'home_page');
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    showSpinner = false;
            });
                },
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
  Future pickImage(ImageSource imageType) async {
    final pickedFile = await _picker.pickImage(
      source: imageType
    );
    if(pickedFile == null) return;
    setState(() {
      _pickedImage = pickedFile as File;
    });
  }

}