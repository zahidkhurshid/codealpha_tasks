import 'package:flutter/material.dart';

class ArtistProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can pass artist ID or name through arguments
    final String artistName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('$artistName\'s Profile',
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
            'Artist Profile Information Goes Here',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
