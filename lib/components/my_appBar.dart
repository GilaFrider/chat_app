import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final List<Widget>? actions;

  const MyAppBar({required this.title, required this.actions});
  
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context){
    return AppBar(
      title: Text(title),
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
    );
  }
}