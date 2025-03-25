import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for artwork, artists, or categories...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Implement search logic here
              },
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[900]!, Colors.blue[600]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Filters
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilterChip(label: 'Newest', onSelected: (selected) {}),
                    FilterChip(label: 'Trending', onSelected: (selected) {}),
                    FilterChip(label: 'Most Liked', onSelected: (selected) {}),
                  ],
                ),
              ),
              // Categories
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Wrap(
                spacing: 8.0,
                children: [
                  CategoryChip(label: 'Abstract'),
                  CategoryChip(label: 'Portrait'),
                  CategoryChip(label: 'Digital Painting'),
                  CategoryChip(label: 'Sculpture'),
                  // Add more categories as needed
                ],
              ),
              // Suggested Artists
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Suggested Artists',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SuggestedArtistsList(),
              // Grid View for Artwork
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Artwork',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ArtworkGrid(), // Add the grid view here
            ],
          ),
        ),
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final ValueChanged<bool> onSelected;

  const FilterChip({required this.label, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: false, // Manage selected state as needed
      onSelected: onSelected,
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      onDeleted: () {
        // Handle category deletion if needed
      },
    );
  }
}

class SuggestedArtistsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample artist data
    final List<String> artists = [
      'Artist 1',
      'Artist 2',
      'Artist 3',
      'Artist 4',
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: artists.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(artists[index]),
          onTap: () {
            // Navigate to artist profile
            Navigator.of(context)
                .pushNamed('/artistProfile', arguments: artists[index]);
          },
        );
      },
    );
  }
}

// New ArtworkGrid widget to display artwork in a grid
class ArtworkGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample artwork data
    final List<String> artworkImages = [
      'assets/Trend/Celestial Goddess.png',
      'assets/Trend/Digital Mirage.png',
      'assets/Trend/Mecha Guardian.png',
      'assets/Trend/Cyber Samurai.png',
      'assets/FY/Space & Sci-Fi.png',
      'assets/FY/Abstract & Digital Art.png',
      'assets/FY/Cyberpunk Cityscape.png',
      'assets/FY/Fantasy Concept Art.png',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        childAspectRatio: 0.75, // Aspect ratio of each item
      ),
      itemCount: artworkImages.length,
      itemBuilder: (context, index) {
        return Card(
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
                child: Text(artworkImages[index]
                    .split('/')
                    .last
                    .split('.')
                    .first), // Updated to remove the file extension
              ),
            ],
          ),
        );
      },
    );
  }
}
