import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' ;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'leads.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE leads(id INTEGER PRIMARY KEY, carId INTEGER, userInfo TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertLead(int carId, String userInfo) async {
    final db = await database;
    await db.insert(
      'leads',
      {'carId': carId, 'userInfo': userInfo},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getLeads() async {
    final db = await database;
    return db.query('leads');
  }

  Future<void> deleteLeads() async {
    final db = await database;
    await db.delete('leads');
  }
}
