import 'package:chat_app/components/my_appBar.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  HomePage();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        title: "USER",
        actions: [],
        
      
      ),
      drawer: MyDrawer(),
    );
  }

}