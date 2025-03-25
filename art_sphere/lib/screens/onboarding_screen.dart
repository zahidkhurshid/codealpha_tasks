import 'package:flutter/material.dart';
import '../Components/fluid_card.dart';
import '../Components/fluid_carousel.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.title});

  final String title;

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController =
      PageController(); // Create a PageController

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to ArtSphere'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: Text('Skip', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: FluidCarousel(
        children: <Widget>[
          FluidCard(
            color: 'Red',
            altColor: Color(0xFF4259B2),
            title: "Discover",
            subtitle: "Explore amazing artwork from artists around the world.",
          ),
          FluidCard(
            color: 'Yellow',
            altColor: Color(0xFF904E93),
            title: "Upload",
            subtitle: "Share your own artwork and get feedback.",
          ),
          FluidCard(
            color: 'Blue',
            altColor: Color(0xFFFFB138),
            title: "Engage",
            subtitle: "Connect with other artists and art lovers.",
          ),
        ],
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/login');
        },
        child: Text('Skip', style: TextStyle(fontSize: 18, color: Colors.blue)),
      ),
    );
  }
}
