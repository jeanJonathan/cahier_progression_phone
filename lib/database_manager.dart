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

        await db.execute('''
          CREATE TABLE IF NOT EXISTS levels (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nom TEXT NOT NULL,
            description TEXT,
            hours_needed INTEGER,
            video_url TEXT,
            sport_id INTEGER NOT NULL,
            created_at TEXT,
            updated_at TEXT,
            FOREIGN KEY (sport_id) REFERENCES sports (id) ON DELETE CASCADE ON UPDATE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS sports (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT,
            created_at TEXT,
            updated_at TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            email_verified_at TEXT,
            password TEXT NOT NULL,
            sport_id INTEGER,
            address TEXT,
            phone TEXT,
            kite_progression INTEGER,
            surf_progression INTEGER,
            wingfoil_progression INTEGER,
            remember_token TEXT,
            created_at TEXT,
            updated_at TEXT,
            FOREIGN KEY (kite_progression) REFERENCES progressions (id) ON DELETE CASCADE ON UPDATE CASCADE,
            FOREIGN KEY (surf_progression) REFERENCES progressions (id) ON DELETE CASCADE ON UPDATE CASCADE,
            FOREIGN KEY (wingfoil_progression) REFERENCES progressions (id) ON DELETE CASCADE ON UPDATE CASCADE,
            FOREIGN KEY (sport_id) REFERENCES sports (id) ON DELETE CASCADE ON UPDATE CASCADE
          )
        ''');
      },
    );
  }
// Méthodes pour interagir avec la base de données

  static Future<void> insertEtapesData() async {
    final db = await database;

    await db.transaction((txn) async {
      await txn.rawInsert('''
        INSERT INTO etapes (id, nom, description, video_url, level_id, created_at, updated_at, isValidated)
        VALUES
          (1, 'Etape 1', 'Description de l\'étape 1', 'https://youtube.com/etape1', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
          (2, 'Etape 2', 'Description de l\'étape 2', 'https://youtube.com/etape2', 1, '2023-01-02 00:00:00', '2023-01-02 00:00:00', 1),
          (3, 'Etape 3', 'Description de l\'étape 3', 'https://youtube.com/etape3', 2, '2023-01-03 00:00:00', '2023-01-03 00:00:00', 0);
      ''');
    });
  }
}