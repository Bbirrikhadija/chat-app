import 'dart:io';
import 'dart:io' as io;
import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/home/home.dart';
import 'package:chat_application/screens/Login/components/body/body.dart';
import 'package:chat_application/screens/Signup/components/body/authform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:chat_application/components/already_have_an_account_acheck.dart';
import 'package:chat_application/components/rounded_button.dart';
import 'package:chat_application/components/rounded_input_field.dart';
import 'package:chat_application/components/rounded_password_field.dart';
import 'package:chat_application/screens/Login/login_screen.dart';
import 'package:chat_application/screens/Signup/components/background.dart';
import 'package:chat_application/screens/Signup/components/or_divider.dart';
import 'package:chat_application/screens/Signup/components/social_icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' ;

class BodyMobile extends StatefulWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  _BodyMobileState createState() => _BodyMobileState();
}

class _BodyMobileState extends State<BodyMobile> {
  FirebaseStorage storage = FirebaseStorage.instance;
  io.File? _image;
  final ImagePicker _picker = ImagePicker();
  final _auth = FirebaseAuth.instance;
  late FirebaseStorage _storage;
  bool islogin = false;
  late String email;
  late String firstname;
  late String lastname;
  late String password;
  var _isLoading = false;
FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _globalkey = GlobalKey<FormState>();
 void _submitAuthForm(
    String email,
    String password,
    String firstname,
    String lastname,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        authResult.user!.updateDisplayName(firstname);
      } else {
         authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
            
        final CollectionReference _userCollection = FirebaseFirestore.instance.collection('/users/UkJSr5o067B20bKihD32');
        _userCollection.doc(_auth.currentUser!.uid).set({
      "firstname": firstname,
       'lastname': lastname,
      "email": email,
     'uid': authResult.user!.uid,
    });
    //     authResult = await _auth.createUserWithEmailAndPassword(
    //         email: email, password: password);
            
    //          await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
    //   "firstname": firstname,
    //    'lastname': lastname,
    //   "email": email,
    //  'uid': authResult.user!.uid,
    // });
    

   // Call the user's CollectionReference to add a new user
  //  await users.doc(authResult.user!.uid).set({
  //       'firstname': firstname,
  //           'lastname': lastname,
  //           'email': email,
  //           'uid': authResult.user!.uid,
  //     });
  //     final snapshot = await users.doc(authResult.user!.uid).get();
      }
      
      } on PlatformException catch (err) {
      var message = 'An error occured. Please check your credentials.';

      if (err.message != null) {
        message = err.message!;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // body:  Authform(submitauthform,_isLoading);
    void getImage(ImageSource imageType) async{
      var image = await _picker.pickImage(source : imageType);
      setState(() {
        if (image != null) {
        _image = io.File(image.path);
        print('image Path');
      }
      Navigator.pop(context);
      });
    }
    Future uploadPic(BuildContext context ) async{
      String fileName = basename(_image!.path);
      // FirebaseFirestore.instance.collection('images').snapshots();
      fileName = FirebaseFirestore.instance.collection('userimages').snapshots() as String;
    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance
        .ref().child('uploads').child('/$fileName');
    //       final metadata = firebase_storage.SettableMetadata(
    //     contentType: 'image/jpeg',
    //     customMetadata: {'picked-file-path': fileName});

  // firebase_storage.UploadTask uploadTask;
  //   uploadTask = ref.putFile(io.File(_image!.path));
      // StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
        // firebase_storage.UploadTask task= await Future.value(uploadTask);
    // Future.value(uploadTask).then((value) => {
    // print("Upload file path ${value.ref.fullPath}")
    // }).onError((error, stackTrace) => {
    //   print("Upload file path error ${error.toString()} ")
    // });
    

      // StorageTaskSnapchot taskSnapchot = await uploadTask.onComplete;
      // setState(() {
      //   print("picture uploaded");
      //   Scaffold.of(context).showSnackBar(snackbar(context : Text('profile Picture uploaded')));
      // });
    }
    
    Size size = MediaQuery.of(context).size;
    body: Authform(_submitAuthForm, _isLoading,);
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
                  child :  ClipOval(
                    child: SizedBox(
                      width: 168,
                      height: 180,
                      child: (_image!= null)? Image.file(_image!, fit:BoxFit.fill):
                      Image.asset('assets/images/bg-camera.jpg', fit: BoxFit.fill,),
                  ),
                  )
                  ),
                  ), 
                  
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
                            onTap:(){ getImage(ImageSource.camera);},
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
                            onTap:()
                            {getImage(ImageSource.gallery);
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
              // add this
                //  key: ValueKey('email'),
                //     validator: (val) {
                //       if (val!.isEmpty || !val.contains('@')) {
                //         return "please enter a valid email address";
                //       } else
                //         return null;
                //     },
                //     onSaved: (val) => email = val!,
                //     keyboardType: TextInputType.emailAddress,
                //     decoration: InputDecoration(labelText: 'email address'),
                      hintText: "email",
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
  //  void _pickImageCamera() async {
  //   final picker = ImagePicker();
  //   final pickedImage =
  //       await picker.pickImage(source: ImageSource.camera, imageQuality: 10);
  //   final pickedImageFile = File(pickedImage!.path);
  //   setState(() {
  //     _pickedImage = pickedImageFile;
  //   });
  //   Navigator.pop(context);
  // }
  // void _pickImageGallery() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //   final pickedImageFile = File(pickedImage!.path);
  //   setState(() {
  //     _pickedImage = pickedImageFile;
  //   });
  //   Navigator.pop(context);
  // }
}


  // Future uploadFile2(File? file, context) async {
  //   if (file == null) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("No file was selected")));
  //     return null;
  //   }
  //   Random rand = new Random();
  //   image = File(file.path);
  //   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('photos')
  //       .child('/${DateTime.now().toIso8601String()}');
  //   UploadTask uploadTask = ref.putFile(image!);
  //   await uploadTask.whenComplete(() async {
  //     var url = await ref.getDownloadURL();
  //     this.imageUri = url.toString();
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  //   update();
  //   return await ref.getDownloadURL();
  // }

