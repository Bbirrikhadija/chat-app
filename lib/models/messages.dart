import 'package:chat_application/models/user.dart';

class Message {
    User user;
    String message;
    String time;
    bool isLiked;
    bool unread;
    Message(this.user, this.message, this.time, this.isLiked, this.unread);

}