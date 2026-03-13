import 'package:flutter/material.dart';
import '../designs/gradient_background.dart';
import 'home_screen.dart';
import 'opened_capsule_screen.dart';

class CapsuleGalleryScreen extends StatelessWidget {
  final DateTime? newCapsuleOpeningDate;
  final int userId; // Add userId as a required parameter

  const CapsuleGalleryScreen({
    super.key,
    this.newCapsuleOpeningDate,
    required this.userId, // Mark userId as required
  });

  @override
  Widget build(BuildContext context) {
    // Example capsule opening dates
    final List<DateTime> capsuleOpeningDates = [
      DateTime.now().subtract(const Duration(days: 1)), // Ready to open
      DateTime.now().add(const Duration(days: 6)),
      DateTime.now().add(const Duration(days: 13)),
      DateTime.now().add(const Duration(days: 279)),
      DateTime.now().add(const Duration(days: 435)),
      DateTime.now().add(const Duration(days: 601)),
    ];

    if (newCapsuleOpeningDate != null) {
      capsuleOpeningDates.insert(0, newCapsuleOpeningDate!);
    }

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Gradient background
        body: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Your Capsules',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: capsuleOpeningDates.length,
                itemBuilder: (context, index) {
                  final date = capsuleOpeningDates[index];
                  final daysRemaining = date.difference(DateTime.now()).inDays;
                  final isReadyToOpen = daysRemaining <= 0;

                  return GestureDetector(
                    onTap: () {
                      if (isReadyToOpen) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenedCapsuleScreen(
                              title: 'Special Memory',
                              location: 'Barcelona, Spain',
                              imageUrl: 'assets/club_picture.jpg', // Replace with your actual image URL
                              fixedDate: DateTime(2022, 7, 29), // Fixed date: 29/07/2022
                            ),
                          ),
                        );

                      } else {
                        _showPopup(context);
                      }
                    },
                    child: _buildCapsule(
                      isReadyToOpen: isReadyToOpen,
                      daysRemaining: daysRemaining,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(userId: userId), // Pass userId
                      ),
                    );
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
    );
  }

  Widget _buildCapsule({required bool isReadyToOpen, required int daysRemaining}) {
    return Container(
      width: 127,
      height: 143,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        gradient: isReadyToOpen
            ? const LinearGradient(colors: [Colors.green, Colors.greenAccent])
            : const LinearGradient(colors: [Colors.purpleAccent, Colors.blueAccent]),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Container(
              width: 110,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  colors: [Colors.black26, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Icon(
                isReadyToOpen ? Icons.check_circle : Icons.hourglass_empty,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Text(
              isReadyToOpen
                  ? 'Ready to be opened'
                  : 'Opens in $daysRemaining days',
              style: TextStyle(
                color: Colors.white,
                fontSize: daysRemaining > 99 ? 12 : 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.purple[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: const Text(
            'Oops, you still have to wait to open this!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }
}
