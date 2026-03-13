import 'package:flutter/material.dart';
import '../designs/gradient_background.dart'; // Import your gradient background

class OpenedCapsuleScreen extends StatelessWidget {
  final String title; // Title of the memory
  final String location; // Location of the memory
  final String imageUrl; // URL of the image
  final DateTime fixedDate; // Fixed date (29/07/2022)

  const OpenedCapsuleScreen({
    super.key,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.fixedDate,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate how many days have passed since the fixed date
    final int daysAgo = DateTime.now().difference(fixedDate).inDays;

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Ensure gradient shows
        body: Column(
          children: [
            const SizedBox(height: 60),
            // Display the memory date
            Text(
              'Your memories from ${fixedDate.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Display the number of days passed
            Text(
              '$daysAgo days ago',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Display the memory title
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Display the image
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(imageUrl), // Load local image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Display the location
            Text(
              location,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            // Home button
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
          ],
        ),
      ),
    );
  }
}
