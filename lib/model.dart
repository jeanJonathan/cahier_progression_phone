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


        await db.execute('''
          CREATE TABLE IF NOT EXISTS progressions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT NOT NULL,
            location TEXT NOT NULL,
            weather TEXT NOT NULL,
            notes TEXT,
            user_id INTEGER,
            etape_id INTEGER NOT NULL,
            surf_progression INTEGER,
            kite_progression INTEGER,
            wingfoil_progression INTEGER,
            created_at TEXT,
            updated_at TEXT,
            photo1_url TEXT,
            photo2_url TEXT,
            photo3_url TEXT,
            FOREIGN KEY (etape_id) REFERENCES levels (id) ON DELETE CASCADE ON UPDATE CASCADE,
            FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
          )
        ''');


      },
    );
  }
// Méthodes pour interagir avec la base de données

}