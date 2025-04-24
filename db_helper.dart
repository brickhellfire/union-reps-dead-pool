import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/entry.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'entries.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE entries("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "manager TEXT,"
          "players TEXT,"
          "date TEXT,"
          "amount REAL)"
        );
      },
    );
  }

  static Future<void> insertEntry(Entry entry) async {
    final db = await database;
    await db.insert('entries', entry.toMap());
  }

  static Future<List<Entry>> getEntries() async {
    final db = await database;
    final maps = await db.query('entries', orderBy: 'id DESC');
    return maps.map((e) => Entry.fromMap(e)).toList();
  }
}
