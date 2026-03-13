import 'package:flutter/material.dart';
import '../repository/profile_repository.dart';
import '../models/profile_model.dart';
import '../designs/gradient_background.dart';
import 'home_screen.dart'; // Import HomeScreen for navigation

class ProfileScreen extends StatefulWidget {
  final int userId; // Accept userId to fetch profile data dynamically

  const ProfileScreen({super.key, required this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileRepository _profileRepository = ProfileRepository();
  Profile? _profile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      // Fetch the profile data using the userId
      Profile? profile = await _profileRepository.getProfileById(widget.userId);

      if (mounted) {
        setState(() {
          _profile = profile; // Set the profile data
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error loading profile')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else if (_profile == null)
                const Center(
                  child: Text(
                    'Profile not found',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      color: Colors.white70,
                    ),
                  ),
                )
              else
                Expanded(
                  child: Column(
                    children: [
                      // Profile Picture
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                        const AssetImage('assets/profile_picture.png'),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      // User Name
                      Text(
                        _profile!.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Color(0xFFD0A8F2),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // User Email
                      Text(
                        _profile!.email,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 50),
                      // Fields of Interest Title
                      const Text(
                        'Fields of Interest',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Color(0xFFD0A8F2),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Fields of Interest
                      Expanded(
                        child: _profile!.preferences.isEmpty
                            ? const Center(
                          child: Text(
                            'No preferences available',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Inter',
                              color: Colors.white70,
                            ),
                          ),
                        )
                            : _buildInterestsPyramid(_profile!.preferences),
                      ),
                    ],
                  ),
                ),
              // Home Button
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(userId: widget.userId),
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
                      size: 40,
                      color: Color(0xFFAC08D9),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInterestsPyramid(String preferencesJson) {
    // Parse preferences from the JSON string
    List<String> preferences = List<String>.from(preferencesJson.split(','));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Top Row (1 icon)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInterestIcon(preferences.isNotEmpty ? preferences[0] : ''),
          ],
        ),
        const SizedBox(height: 20),
        // Middle Row (2 icons)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInterestIcon(preferences.length > 1 ? preferences[1] : ''),
            const SizedBox(width: 40),
            _buildInterestIcon(preferences.length > 2 ? preferences[2] : ''),
          ],
        ),
        const SizedBox(height: 20),
        // Bottom Row (3 icons)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInterestIcon(preferences.length > 3 ? preferences[3] : ''),
            const SizedBox(width: 40),
            _buildInterestIcon(preferences.length > 4 ? preferences[4] : ''),
            const SizedBox(width: 40),
            _buildInterestIcon(preferences.length > 5 ? preferences[5] : ''),
          ],
        ),
      ],
    );
  }

  Widget _buildInterestIcon(String label) {
    return label.isNotEmpty
        ? Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFFAC08D9), Color(0xFFE0A2F1)],
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
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    )
        : Container(); // Empty container if no label
  }
}
