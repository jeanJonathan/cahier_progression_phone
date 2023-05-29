import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static Database? _database;
  static const String _databaseName = 'bd_cahier_progression.db';

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Creation des tables

        await db.execute('''
          CREATE TABLE IF NOT EXISTS etapes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nom TEXT NOT NULL,
            description TEXT,
            video_url TEXT,
            level_id INTEGER NOT NULL,
            created_at TEXT,
            updated_at TEXT,
            isValidated INTEGER NOT NULL DEFAULT 0,
            FOREIGN KEY (level_id) REFERENCES levels (id) ON DELETE CASCADE ON UPDATE CASCADE
          )
        ''');

      },
    );
  }
// Méthodes pour interagir avec la base de données

}