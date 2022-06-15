import 'package:chat_application/responsive/responsive.dart';
import 'package:chat_application/screens/Login/components/body/body_desktop.dart';
import 'package:chat_application/screens/Login/components/body/body_mobile.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: BodyMobile(),
      tablet: BodyDesktop(),
      desktop: BodyDesktop(),
    );
  }
}
