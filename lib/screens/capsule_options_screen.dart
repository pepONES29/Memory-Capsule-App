import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../designs/gradient_background.dart';
import '../designs/button_styles.dart';
import 'create_text_capsule_screen.dart';
import 'create_photo_capsule_screen.dart';

class CapsuleOptionsScreen extends StatelessWidget {
  final int userId; // Add userId as a required parameter

  const CapsuleOptionsScreen({super.key, required this.userId}); // Include userId in constructor

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      // Open the camera and capture a photo
      final XFile? capturedPhoto = await picker.pickImage(source: ImageSource.camera);

      if (capturedPhoto != null) {
        // Navigate directly to CreatePhotoCapsuleScreen with the captured photo
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatePhotoCapsuleScreen(
              userId: userId,
              photo: File(capturedPhoto.path), // Pass the captured photo
            ),
          ),
        );
      }
    } catch (e) {
      // Show an error message if capturing fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error capturing photo: $e')),
      );
    }
  }

  Future<void> _openGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      // Open the gallery and select a photo
      final XFile? selectedPhoto = await picker.pickImage(source: ImageSource.gallery);

      if (selectedPhoto != null) {
        // Navigate directly to CreatePhotoCapsuleScreen with the selected photo
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatePhotoCapsuleScreen(
              userId: userId,
              photo: File(selectedPhoto.path), // Pass the selected photo
            ),
          ),
        );
      }
    } catch (e) {
      // Show an error message if selection fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting photo: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Create a new memory',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCircularButton(context, 'Open Camera', 180, () => _openCamera(context)),
                          const SizedBox(width: 30),
                          _buildCircularButton(context, 'Choose From Gallery', 180, () => _openGallery(context)),
                        ],
                      ),
                      const SizedBox(height: 40),
                      _buildCircularButton(context, 'Text Capsule', 180, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateTextCapsuleScreen(userId: userId), // Pass userId
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 00),
              GestureDetector(
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
                    size: 40,
                    color: Color(0xFFAC08D9),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton(BuildContext context, String label, double size, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: ButtonGradients.circularButtonGradient,
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
