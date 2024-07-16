import 'package:chat_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget{
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    required this.message,
    required this.isCurrentUser,
  });


  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context,listen: false).isDartMode;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical:2.5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isCurrentUser
        ? Colors.green.shade600 
        :isDarkMode? Colors.grey.shade900:Colors.grey.shade200,
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser ? Colors.white : (isDarkMode ? Colors. white : Colors.black)
        ),
      ),
    );
  }
}