import 'package:chat_application/models/user.dart';

class Message {
    User user;
    String lastMessage;
    String lastTime;
    Message(this.user, this.lastMessage, this.lastTime);

    static List<Message> generateHomePageMessages(){
        return [
            Message( users[0], 'Hey there! How are you? It’s been a while! ', '10:29'),
            Message( users[1], 'Hey there! How are you? It’s been a while! ', '12:30'),
            Message( users[2], 'Hey there! How are you? It’s been a while! ', '7:30'),
            Message( users[3], 'Hey there! How are you? It’s been a while! ', '7:30'),
            Message( users[4], 'Hey there! How are you? It’s been a while! ', '12:30'),
            Message( users[5], 'Hey there! How are you? It’s been a while! ', '12:30'),
            Message( users[6], 'Hey there! How are you? It’s been a while! ', '12:30'),
        ];
    }
}
var users = User.generateUsers();