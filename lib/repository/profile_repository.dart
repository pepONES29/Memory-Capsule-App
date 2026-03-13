import '../screens/database_helper.dart';
import '../models/profile_model.dart';

class ProfileRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Insert a new profile into the database
  Future<int> insertProfile(Profile profile) async {
    final db = await _dbHelper.database;

    // Insert the profile into the 'profiles' table
    return await db.insert(
      'profiles', // Table name
      profile.toMap(), // Convert the Profile object to a Map
    );
  }

  // Fetch a single profile by ID
  Future<Profile?> getProfileById(int userId) async {
    final db = await _dbHelper.database;

    final List<Map<String, dynamic>> result = await db.query(
      'profiles', // Table name
      where: 'id = ?', // Filter by id
      whereArgs: [userId], // Argument for the WHERE clause
    );

    if (result.isNotEmpty) {
      return Profile.fromMap(result.first); // Convert the first result to a Profile object
    }

    return null; // Return null if no profile is found
  }
}
