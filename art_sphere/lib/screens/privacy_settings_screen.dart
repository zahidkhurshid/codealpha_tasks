import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings',
          style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple[900],
      iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            'Privacy Settings Options Go Here',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
