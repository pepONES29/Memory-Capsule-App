import 'package:flutter/material.dart';
import 'dart:io';
import 'create_photo_capsule_screen.dart';

class PhotoPreviewScreen extends StatelessWidget {
  final int userId;
  final File photo;

  const PhotoPreviewScreen({
    super.key,
    required this.userId,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Photo')),
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              photo,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to retake/reselect
                  },
                  child: const Text('Retake/Reselect'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to CreatePhotoCapsuleScreen with the confirmed photo
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatePhotoCapsuleScreen(
                          userId: userId,
                          photo: photo,
                        ),
                      ),
                    );
                  },
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
