import 'package:sqflite/sqflite.dart';

import 'database_manager.dart';
import 'model.dart';

class CRUDOperations {
  static Future<int> insertEtape(Etape etape) async {
    final db = await DatabaseManager.database;
    return await db.insert('etapes', etape.toMap());
  }

  static Future<int> updateEtape(Etape etape) async {
    final db = await DatabaseManager.database;
    return await db.update(
      'etapes',
      etape.toMap(),
      where: 'id = ?',
      whereArgs: [etape.id],
    );
  }

  static Future<int> deleteEtape(int id) async {
    final db = await DatabaseManager.database;
    return await db.delete(
      'etapes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Etape>> getEtapes() async {
    final db = await DatabaseManager.database;
    final List<Map<String, dynamic>> maps = await db.query('etapes');

    return List.generate(maps.length, (index) {
      return Etape.fromMap(maps[index]);
    });
  }

  static Future<int> insertProgression(Progression progression) async {
    final db = await DatabaseManager.database;
    return await db.insert('progressions', progression.toMap());
  }

  static Future<int> updateProgression(Progression progression) async {
    final db = await DatabaseManager.database;
    return await db.update(
      'progressions',
      progression.toMap(),
      where: 'id = ?',
      whereArgs: [progression.id],
    );
  }

  static Future<int> deleteProgression(int id) async {
    final db = await DatabaseManager.database;
    return await db.delete(
      'progressions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Progression>> getProgressions() async {
    final db = await DatabaseManager.database;
    final List<Map<String, dynamic>> maps = await db.query('progressions');

    return List.generate(maps.length, (index) {
      return Progression.fromMap(maps[index]);
    });
  }

  static Future<int> insertLevel(Level level) async {
    final db = await DatabaseManager.database;
    return await db.insert('levels', level.toMap());
  }

  static Future<int> updateLevel(Level level) async {
    final db = await DatabaseManager.database;
    return await db.update(
      'levels',
      level.toMap(),
      where: 'id = ?',
      whereArgs: [level.id],
    );
  }

  static Future<int> deleteLevel(int id) async {
    final db = await DatabaseManager.database;
    return await db.delete(
      'levels',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Level>> getLevels() async {
    final db = await DatabaseManager.database;
    final List<Map<String, dynamic>> maps = await db.query('levels');

    return List.generate(maps.length, (index) {
      return Level.fromMap(maps[index]);
    });
  }

  static Future<int> insertSport(Sport sport) async {
    final db = await DatabaseManager.database;
    return await db.insert('sports', sport.toMap());
  }

  static Future<int> updateSport(Sport sport) async {
    final db = await DatabaseManager.database;
    return await db.update(
      'sports',
      sport.toMap(),
      where: 'id = ?',
      whereArgs: [sport.id],
    );
  }

  static Future<int> deleteSport(int id) async {
    final db = await DatabaseManager.database;
    return await db.delete(
      'sports',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Sport>> getSports() async {
    final db = await DatabaseManager.database;
    final List<Map<String, dynamic>> maps = await db.query('sports');

    return List.generate(maps.length, (index) {
      return Sport.fromMap(maps[index]);
    });
  }

  static Future<int> insertUser(User user) async {
    final db = await DatabaseManager.database;
    return await db.insert('users', user.toMap());
  }

  static Future<int> updateUser(User user) async {
    final db = await DatabaseManager.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<int> deleteUser(int id) async {
    final db = await DatabaseManager.database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<User>> getUsers() async {
    final db = await DatabaseManager.database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (index) {
      return User.fromMap(maps[index]);
    });
  }
}
