import 'package:flutter/material.dart';
import '../designs/gradient_background.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import '../repository/profile_repository.dart';
import '../models/profile_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  final ProfileRepository _profileRepository = ProfileRepository();

  Future<int> _createProfile(String name, String email, String password) async {
    // Create a new Profile object
    Profile profile = Profile(
      name: name,
      email: email,
      preferences: '', // Add preferences logic if needed
    );

    // Save the profile in the database and get the userId
    return await _profileRepository.insertProfile(profile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Title: Create Your Profile
              const Text(
                'Create your profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 40),
              // Profile Picture and Name Input Side-by-Side
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  children: [
                    // Profile Picture
                    GestureDetector(
                      onTap: () {
                        // Placeholder for profile picture selection
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                        const AssetImage('assets/profile_picture.png'),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Name Input
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Donald Ruth',
                          filled: true,
                          fillColor: Colors.grey[300], // Light grey background
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Email Input
              _buildTextField(
                controller: _emailController,
                hintText: 'donruth1988@gmail.com',
              ),
              const SizedBox(height: 10),
              // Password Input
              _buildTextField(
                controller: _passwordController,
                hintText: 'Password123',
                isPassword: true,
              ),
              const SizedBox(height: 40),
              // Fields of Interest
              const Text(
                'Fields of interest',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 20),
              // Interest Icons (1-2-3 Pyramid)
              Column(
                children: [
                  // First Row: 1 Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildInterestIcon(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Second Row: 2 Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildInterestIcon(),
                      const SizedBox(width: 20),
                      _buildInterestIcon(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Third Row: 3 Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildInterestIcon(),
                      const SizedBox(width: 20),
                      _buildInterestIcon(),
                      const SizedBox(width: 20),
                      _buildInterestIcon(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Create Profile Button
              ElevatedButton(
                onPressed: () async {
                  String name = _nameController.text.trim();
                  String email = _emailController.text.trim();
                  String password = _passwordController.text.trim();

                  if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
                    int userId = await _createProfile(name, email, password);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(userId: userId),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill in all fields')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.purpleAccent),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Create profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Colors.purpleAccent,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Home Button at the Bottom (Navigates to Login Screen)
              GestureDetector(
                onTap: () {
                  // Navigate back to Login Screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white, // Circular white background
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.home,
                    color: Colors.purpleAccent,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable TextField Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword && _obscurePassword,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[300], // Light grey background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: 20.0,
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          )
              : null,
        ),
        style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
      ),
    );
  }

  // Reusable Interest Icon Widget
  Widget _buildInterestIcon() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.purpleAccent.withAlpha(77),
      child: const Icon(
        Icons.interests, // Replace with your actual interest icons
        color: Colors.white,
      ),
    );
  }
}
