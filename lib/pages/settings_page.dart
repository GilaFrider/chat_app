import 'package:chat_app/components/my_appBar.dart';
import 'package:chat_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'S E T T I N G',
        actions: [],
      ),
      body: Center(
        child: Container(
          width: 600,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark Mode',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary, 
              ),
              ),
              CupertinoSwitch(
                onChanged: (value) =>
                Provider.of<ThemeProvider>(context,listen: false).toggleTheme(),
                value:  Provider.of<ThemeProvider>(context,listen: false).isDartMode,
                
              )
            ],
          ),
        ),
      ),
    );
  }
}