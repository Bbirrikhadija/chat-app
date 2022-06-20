import 'package:chat_application/models/user.dart';

class Message {
    User user;
    String message;
    String time;
    bool isLiked;
    bool unread;
    Message(this.user, this.message, this.time, this.isLiked, this.unread);

    static List<Message> generateHomePageMessages(){
        return [
            Message( users[0], 'Hey there! How are you? It’s been a while! ', '10:29', false, true,),
            Message( users[1], 'Hey there! How are you? It’s been a while! ', '12:30', false, true),
            Message( users[2], 'Hey there! How are you? It’s been a while! ', '7:30', false, true),
            Message( users[3], 'Hey there! How are you? It’s been a while! ', '7:30', false, true),
            Message( users[4], 'Hey there! How are you? It’s been a while! ', '12:30', false, true),
            Message( users[5], 'Hey there! How are you? It’s been a while! ', '12:30', false, true),
            Message( users[6], 'Hey there! How are you? It’s been a while! ', '12:30', false, true),
        ];
    }
}
var users = User.generateUsers();