import 'package:chat_application/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AudioMessage extends StatelessWidget {
  final String date, senderProfile;

  const AudioMessage({
    Key? key,
    required this.date,
    required this.senderProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Row(
            children: [
              Text(
                "17:14",
                style: GoogleFonts.inter(
                  color: purpleapp,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 7.0),
              const Icon(
                Icons.check,
                color: purpleapp,
                size: 13.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: 15,
              bottom: 5,
            ),
            padding: const EdgeInsets.all(6),
            height: 55,
            decoration: const BoxDecoration(
              color: purpleapp,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                const IconButton(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                Image.asset(
                  'assets/images/sound-waves.jpg',
                  height: 35,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 10,
          ),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(senderProfile),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}