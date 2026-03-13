import '../screens/database_helper.dart';
import '../models/capsule_model.dart';

class CapsuleRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> insertCapsule(Capsule capsule) async {
    return await _dbHelper.database.then((db) => db.insert('capsules', capsule.toMap()));
  }

  Future<List<Capsule>> getCapsules(int userId) async {
    final List<Map<String, dynamic>> maps = await _dbHelper.database
        .then((db) => db.query('capsules', where: 'user_id = ?', whereArgs: [userId]));
    return maps.map((map) => Capsule.fromMap(map)).toList();
  }
}