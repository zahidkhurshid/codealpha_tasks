import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search & Discover',
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
        child: Column(
          children: [
            Padding(
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
            // Filters
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ChoiceChip(
                    label:
                        Text('Newest', style: TextStyle(color: Colors.white)),
                    selected: false,
                    backgroundColor: Colors.deepPurple[900],
                    selectedColor: Colors.deepPurple[700],
                    onSelected: (selected) {},
                  ),
                  ChoiceChip(
                    label:
                        Text('Trending', style: TextStyle(color: Colors.white)),
                    selected: false,
                    backgroundColor: Colors.deepPurple[900],
                    selectedColor: Colors.deepPurple[700],
                    onSelected: (selected) {},
                  ),
                  ChoiceChip(
                    label: Text('Most Liked',
                        style: TextStyle(color: Colors.white)),
                    selected: false,
                    backgroundColor: Colors.deepPurple[900],
                    selectedColor: Colors.deepPurple[700],
                    onSelected: (selected) {},
                  ),
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
                    color: Colors.black),
              ),
            ),
            Wrap(
              spacing: 8.0,
              children: [
                CategoryChip(
                    label: 'AI Art', backgroundColor: Colors.deepPurple[900]!),
                CategoryChip(
                    label: 'Concept Art',
                    backgroundColor: Colors.deepPurple[900]!),
                CategoryChip(
                    label: '3D Art', backgroundColor: Colors.deepPurple[900]!),
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
            // Add a list of suggested artists here
          ],
        ),
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final ValueChanged<bool> onSelected;
  final TextStyle labelStyle;

  const FilterChip({
    required this.label,
    required this.onSelected,
    required this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label, style: labelStyle),
      selected: false,
      onSelected: onSelected,
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const CategoryChip({
    required this.label,
    this.backgroundColor = Colors.deepPurple,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: TextStyle(color: Colors.white)),
      backgroundColor: backgroundColor,
      onDeleted: () {
        // Handle category deletion if needed
      },
    );
  }
}
