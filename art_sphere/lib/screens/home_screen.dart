import 'package:flutter/material.dart';
import 'explore_screen.dart'; // Import the ExploreScreen
import 'search_screen.dart'; // Import the SearchScreen
import 'settings_screen.dart'; // Import the SettingsScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ArtSphere',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple[900],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'For You',
                  style: TextStyle(
                      color: Colors.white), // Set Tab text color to white
                ),
              ),
              Tab(
                child: Text(
                  'Trending',
                  style: TextStyle(
                      color: Colors.white), // Set Tab text color to white
                ),
              ),
            ],
            indicatorColor: Colors.blue[600], // Set TabBar indicator color
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white), // Search icon
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchScreen()), // Navigate to SearchScreen
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/notifications'),
            ),
            // Directly navigate to SettingsScreen
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white), // Settings icon
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/settings'); // Navigate to SettingsScreen
              },
            ),
            // Profile icon button
            IconButton(
              icon: Icon(Icons.person, color: Colors.white), // Profile icon
              onPressed: () => Navigator.of(context)
                  .pushNamed('/profile'), // Navigate to ProfileScreen
            ),
          ],
        ),
        body: Container(
          // Added Container for gradient backgrounds
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple[900]!, Colors.blue[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: TabBarView(
            children: [
              ForYou(), // For You tab
              Trending(), // Trending tab
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/upload'),
          child: Icon(Icons.add,
              color: Colors.deepPurple), // Set icon color to white
          tooltip: 'Upload Artwork',
        ),
      ),
    );
  }
}

class ForYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample artwork data
    final List<String> artworkImages = [
      'assets/FY/Abstract & Digital Art.png',
      'assets/FY/Minimalist Geometric Art.png',
      'assets/FY/Fantasy Concept Art.png',
      'assets/FY/Cyberpunk Cityscape.png',
      'assets/FY/Surreal Artwork.png',
      'assets/FY/Realistic Portrait Illustration.png',
      'assets/FY/Space & Sci-Fi.png',
      'assets/FY/Nature & Landscape Art.png',
      'assets/FY/Dark Gothic Art.png',
      'assets/FY/Anime & Stylized Artwork.png',
      'assets/Trend/Neon Dreamscape.png',
      'assets/Trend/Cyber Samurai.png',
      'assets/Trend/Celestial Goddess.png',
      'assets/Trend/Digital Mirage.png',
      'assets/Trend/Post-Apocalyptic Haven.png',
      'assets/Trend/Glitch Reality.png',
      'assets/Trend/Mystic Forest Portal.png',
      'assets/Trend/Mecha Guardian.png',
      'assets/Trend/Dreamlike Ocean City.png',
      'assets/Trend/AI-Generated Renaissance.png',
    ];

    return Container(
      // Added Container for background color
      color: Colors.white, // Set background color for "For You" tab
      child: Column(
        children: [
          // Button to navigate to ExploreScreen
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ExploreScreen()),
                );
              },
              child: Text(
                'Explore More Artwork',
                style: TextStyle(
                    color: Colors.deepPurple[900]), // Adjusted text color
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 0.85, // Aspect ratio of each item
              ),
              itemCount: artworkImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/artworkDetail',
                      arguments: artworkImages[index]),
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
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white), // Adjusted text color
                          ), // Updated to remove the file extension
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample artwork data
    final List<String> artworkImages = [
      'assets/Trend/Neon Dreamscape.png',
      'assets/Trend/Cyber Samurai.png',
      'assets/Trend/Celestial Goddess.png',
      'assets/Trend/Digital Mirage.png',
      'assets/Trend/Post-Apocalyptic Haven.png',
      'assets/Trend/Glitch Reality.png',
      'assets/Trend/Mystic Forest Portal.png',
      'assets/Trend/Mecha Guardian.png',
      'assets/Trend/Dreamlike Ocean City.png',
      'assets/Trend/AI-Generated Renaissance.png',
      'assets/FY/Abstract & Digital Art.png',
      'assets/FY/Minimalist Geometric Art.png',
      'assets/FY/Fantasy Concept Art.png',
      'assets/FY/Cyberpunk Cityscape.png',
      'assets/FY/Surreal Artwork.png',
      'assets/FY/Realistic Portrait Illustration.png',
      'assets/FY/Space & Sci-Fi.png',
      'assets/FY/Nature & Landscape Art.png',
      'assets/FY/Dark Gothic Art.png',
      'assets/FY/Anime & Stylized Artwork.png',
    ];

    return Container(
      // Added Container for background color
      color: Colors.white, // Set background color for "Trending" tab
      child: Column(
        children: [
          // Button to navigate to ExploreScreen
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ExploreScreen()),
                );
              },
              child: Text(
                'Explore More Artwork',
                style: TextStyle(
                    color: Colors.deepPurple[900]), // Adjusted text color
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 0.85, // Aspect ratio of each item
              ),
              itemCount: artworkImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/artworkDetail',
                      arguments: artworkImages[index]),
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
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white), // Adjusted text color
                          ), // Updated to remove the file extension
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
