import 'package:chat_app/components/my_appBar.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget{
  HomePage();

  final AuthService _authService =  AuthService();
  final ChatService _chatService = ChatService();

Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading..");
        }

        return ListView(
          children: snapshot.data!.map<Widget>((user) =>
           _buidUserListItem(user, context)).toList(),
        );
      },
    );
  }

 Widget _buidUserListItem(Users user, BuildContext context) {
    if (_authService.getCurrentUser()!.email != user.email) {
      return UserTile(
        users: user,
        onTap: () async {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ChatPage(
          //       receiverEmail: user.email,
          //       receiverID: user.uid
          //     ),
          //   ),
          // );
          await _chatService.markMessageAsRead(
            _authService.getCurrentUser()!.uid, user.uid
          );
        },
      );
    } 
    return Container();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        title: "USER",
        actions: [],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

}