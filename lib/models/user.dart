import 'package:flutter/material.dart';
class User{
  num id;
  String firstName;
  String lastName;
  String iconUrl;
  Color bgColor;
  User(this.id, this.firstName, this.lastName, this.iconUrl, this.bgColor);
  static List<User> generateUsers(){
    return [
      User(1, 'Khadija', 'Bbirri', 'assets/images/user1.jpg', Color(0xFFEDEEF7)),
      User(2, 'Anouar', 'Salhi', 'assets/images/user22.jpg', Color(0xFFEDEEF7))
    ];
  }
}