import 'package:flutter/material.dart';

class ArtworkDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String artworkImage =
        ModalRoute.of(context)!.settings.arguments as String;

    // Assuming you have a list of artwork images
    final List<String> artworkImages = [
      'assets/artwork1.png', // Replace with actual image paths
      'assets/artwork2.png',
      'assets/artwork3.png',
      // Add more images as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artwork Detail',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Implement zoom functionality here
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Image.asset(artworkImage, fit: BoxFit.cover),
                    ),
                  );
                },
                child: Image.asset(
                  artworkImage,
                  fit: BoxFit.cover,
                  height: 500, // Adjust height as needed
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 20),
              Text(
                artworkImage
                    .split('/')
                    .last
                    .split('.')
                    .first, // Use artworkImage directly
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Artist Name', // Replace with actual artist name
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {
                      // Handle like action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
                      // Handle comment action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Handle share action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () {
                      // Handle save action
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle buy now action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[900], // Set button color
                    ),
                    child: Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white), // Set text color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to artist profile
                  Navigator.of(context).pushNamed('/artistProfile',
                      arguments: 'Artist ID or Name');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[900], // Set button color
                ),
                child: Text(
                    'View Artist Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
