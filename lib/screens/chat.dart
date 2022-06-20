import 'package:chat_application/constants/colors.dart';
import 'package:chat_application/widgets/audiomessage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/imagemessage.dart';
import '../widgets/textmessage.dart';

class ChatScreen extends StatelessWidget {
  final String senderProfile = 'assets/images/user1.jpg';
  final String receiverProfile = 'assets/images/uer2.png';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      appBar: AppBar(
        backgroundColor: purpleapp,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 23,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
      ),
      body: ChatingSection(),
      bottomNavigationBar: BottomSection(),
      );

    
  }
}
class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10.0,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 43,
                decoration: const BoxDecoration(
                  color: purpleapp,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Row(
                  children: const [
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.insert_emoticon,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.upload_outlined,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.image,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 25,
              ),
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: purpleapp,
                shape: BoxShape.circle,
              ),
              child: const IconButton(
                icon: Icon(
                  Icons.mic_none_sharp,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}    

class ChatingSection extends StatelessWidget {
  final String senderProfile = 'images/avatar/a3.jpg';
  final String receiverProfile = 'images/avatar/a6.jpg';
  const ChatingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              "Alla Burda",
              style: GoogleFonts.inter(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Was online 56 seconde ago",
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 45),
            TextMessage(
              message: "Months on ye at by esteem",
              date: "17:19",
              senderProfile: senderProfile,
              isReceiver: 1,
              isDirect: 0,
            ),
            TextMessage(
              message: "Seen you eyes son show",
              date: "17:13",
              senderProfile: senderProfile,
              isReceiver: 0,
              isDirect: 0,
            ),
            TextMessage(
              message: "As tolerably recommend shameless",
              date: "17:10",
              senderProfile: senderProfile,
              isReceiver: 0,
              isDirect: 1,
            ),
            TextMessage(
              message: "She although cheerful perceive",
              date: "17:12",
              senderProfile: senderProfile,
              isReceiver: 1,
              isDirect: 0,
            ),
            const ImageMessage(
              image: 'assets/images/user3.png',
              date: "17:09",
              description: "Least their she you now above going stand forth",
            ),
            AudioMessage(date: "18:05", senderProfile: senderProfile),
            TextMessage(
              message: "Provided put unpacked now but bringing. ",
              date: "17:19",
              senderProfile: senderProfile,
              isReceiver: 1,
              isDirect: 0,
            ),
            TextMessage(
              message: "Under as seems we me stuff",
              date: "16:53",
              senderProfile: senderProfile,
              isReceiver: 0,
              isDirect: 0,
            ),
            TextMessage(
              message: "Next it draw in draw much bred",
              date: "16:50",
              senderProfile: senderProfile,
              isReceiver: 0,
              isDirect: 1,
            ),
            TextMessage(
              message: "Sure that that way gave",
              date: "16:48",
              senderProfile: senderProfile,
              isReceiver: 1,
              isDirect: 0,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}