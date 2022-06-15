import 'package:chat_application/components/already_have_an_account_acheck.dart';
import 'package:chat_application/components/rounded_button.dart';
import 'package:chat_application/components/rounded_input_field.dart';
import 'package:chat_application/components/rounded_password_field.dart';
import 'package:chat_application/screens/Login/login_screen.dart';
import 'package:chat_application/screens/Signup/components/background.dart';
import 'package:chat_application/screens/Signup/components/or_divider.dart';
import 'package:chat_application/screens/Signup/components/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyMobile extends StatelessWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
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
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
