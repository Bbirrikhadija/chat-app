import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/widgets/messages.dart';
import 'package:chat_application/widgets/recent_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../screens/profile.dart';
import '../constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;

  void _navigationBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List <Widget>_screens=[HomePage(),Text('Hello beautiful people!'),Profile(),];
  

  @override
  Widget build (BuildContext context){   
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: 
        Container(
          
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top),
            
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Container(
                child:
                Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text('Friend chat',
            style : TextStyle(
              color: kprimary,
              fontWeight: FontWeight.bold,
              fontSize: 28
            ), ),
            ),
            
            
          ),
            RecentContacts(),
            Messages(),
          ],
       
        ),

      ),
      floatingActionButton: 
      FloatingActionButton(
        onPressed: () {}, 
        backgroundColor: purpleapp,
          child: const Icon( Icons.edit,
          size: 20,), ), 
      bottomNavigationBar:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
           currentIndex: _selectedIndex,
        onTap: _navigationBottomBar,
        selectedItemColor: Colors.deepPurple[300],
        showUnselectedLabels: false, items: const [
        BottomNavigationBarItem(
            icon: Icon(
                Icons.message_rounded),
            label: 'Chats'),
        BottomNavigationBarItem(
            icon: Icon(
                Icons.people_outlined),
            label: 'Friends'),
        BottomNavigationBarItem(
            icon: Icon(
                Icons.person_outlined),
            label: 'Profile'
        ),
        ],
        ),
    );
  }
}

// Future getImage(BuildContext context) async {
//     final pickedFile = await picker.pickImage(source fb: ImageSource.gallery);
//     if (pickedFile != null) {
//       return pickedFile;
//     } else {
//       return null;
//     }
//   }

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