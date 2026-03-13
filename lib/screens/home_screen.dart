import 'package:flutter/material.dart';
import '../designs/gradient_background.dart';
import 'profile_screen.dart';
import 'capsule_gallery_screen.dart';
import 'capsule_options_screen.dart';
import 'daily_adventure_screen.dart';
import 'daily_gooddeed_screen.dart';

class HomeScreen extends StatelessWidget {
  final int userId; // Accept userId as a parameter

  const HomeScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Picture
              GestureDetector(
                onTap: () {
                  // Navigate to ProfileScreen, passing userId
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(userId: userId),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: const AssetImage('assets/profile_picture.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              // Center Buttons
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCircularButton(
                            context,
                            'Daily Adventure',
                            155,
                            const DailyAdventureScreen(),
                          ),
                          const SizedBox(width: 20),
                          _buildCircularButton(
                            context,
                            'Daily Good Deed',
                            155,
                            const DailyGoodDeedScreen(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCircularButton(
                            context,
                            'Create a new capsule',
                            155,
                            CapsuleOptionsScreen(userId: userId), // Pass userId
                          ),
                          const SizedBox(width: 20),
                          _buildCircularButton(
                            context,
                            'Capsule Gallery',
                            155,
                            CapsuleGalleryScreen(
                              userId: userId, // Pass userId
                              newCapsuleOpeningDate: DateTime.now()
                                  .add(const Duration(days: 7)), // Example
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      // Stay on HomeScreen (for now, no navigation)
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.home,
                        size: 40.0,
                        color: Color(0xFFAC08D9),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton(
      BuildContext context,
      String label,
      double size,
      Widget nextScreen,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFFAC08D9), Color(0xFFE0A2F1), Color(0xFFFFFFFF)],
            stops: [0.17, 0.69, 0.89],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
