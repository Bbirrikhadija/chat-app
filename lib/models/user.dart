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
      User(2, 'Master', 'isi', 'assets/images/masterisii.jpg', Color(0xFFEDEEF7)),
      User(3, 'Laila', 'Bbirri', 'assets/images/user2.png', Color(0xFFEDEEF7)),
      User(4, 'Abdelfttah', 'Bbirri', 'assets/images/user4.jpg', Color(0xFFEDEEF7)),
      User(5, 'Adessamad', 'Bbirri', 'assets/images/user5.png', Color(0xFFEDEEF7)),
      User(6, 'Anouar', 'Salhi', 'assets/images/user6.png', Color(0xFFEDEEF7)),
      User(7, 'Mohammed', 'Bbirri', 'assets/images/user3.png', Color(0xFFEDEEF7)),
    ];
  }
}