// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:chat_application/screens/Signup/components/body/body_desktop.dart';

// class People extends StatelessWidget {
//   People({Key? key}) : super(key: key);
//   var currentUser = FirebaseAuth.instance.currentUser?.uid;

//   void callChatDetailScreen(BuildContext context, String name, String uid) {
//     Navigator.push(
//         context,
//         CupertinoPageRoute(
//             builder: (context) =>
//                 Chat(friendUid: uid, friendName: name)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         CupertinoSliverNavigationBar(
//           largeTitle: Text("People"),
//         ),
//         SliverToBoxAdapter(
//           key: UniqueKey(),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: CupertinoSearchTextField(
//               onChanged: (value) => usersState.setSearchTerm(value),
//               onSubmitted: (value) => usersState.setSearchTerm(value),
//             ),
//           ),
//         ),
//         Observer(
//           builder: (_) => SliverList(
//             delegate: SliverChildListDelegate(
//               usersState.people
//                   .map(
//                     (dynamic data) => CupertinoListTile(
//                       leading: CircleAvatar(
//                         radius: 20,
//                         backgroundImage: NetworkImage(
//                             data['picture'] != null ? data['picture'] : ''),
//                       ),
//                       onTap: () => callChatDetailScreen(
//                           context,
//                           data['name'] != null ? data['name'] : '',
//                           data['uid']),
//                       title: Text(data['name'] != null ? data['name'] : ''),
//                       subtitle:
//                           Text(data['status'] != null ? data['status'] : ''),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }