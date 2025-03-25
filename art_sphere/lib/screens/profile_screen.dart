import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for the profile
    final String profilePicture =
        'assets/profile_picture.png'; // Replace with actual image path
    final String bio = 'This is a sample bio of the artist/user.';
    final int followerCount = 150; // Sample follower count
    final int followingCount = 75; // Sample following count
    final List<String> artworkImages = [
      'assets/FY/Abstract & Digital Art.png',
      'assets/FY/Minimalist Geometric Art.png',
      'assets/FY/Fantasy Concept Art.png',
      'assets/FY/Cyberpunk Cityscape.png',
      'assets/FY/Surreal Artwork.png',
      'assets/FY/Space & Sci-Fi.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
              SizedBox(height: 10),
              // Profile Picture
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(profilePicture),
              ),
              SizedBox(height: 10),
              // Bio
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bio,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              // Follower and Following Count
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '$followerCount Followers',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$followingCount Following',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Artwork Gallery
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Artwork Gallery',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 0.75, // Aspect ratio of each item
                ),
                itemCount: artworkImages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to artwork detail page
                      Navigator.of(context).pushNamed('/artworkDetail',
                          arguments: artworkImages[index]);
                    },
                    child: Card(
                      color: Colors.deepPurple[900],
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              artworkImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              artworkImages[index]
                                  .split('/')
                                  .last
                                  .split('.')
                                  .first,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ), // Updated to remove the file extension
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
