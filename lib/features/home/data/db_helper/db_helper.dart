import 'package:cake_local/features/home/data/models/cake_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize database if not already initialized
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'meals.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imageUrl TEXT,
        name TEXT,
        description TEXT,
        rate REAL,
        price REAL,
        time TEXT
      )
    ''');
  }

  Future<int> insertMeal(CakeModel meal) async {
    Map<String, dynamic> mealMap = meal.toMap();
    final db = await database;
    return await db.insert('meals', mealMap);
  }

  Future<List<CakeModel>> getMeals() async {
    final db = await database;
    List<Map<String, dynamic>> cakesJson = await db.query('meals');
    List<CakeModel> cakes =
        cakesJson.map((mealJson) {
          return CakeModel.fromMap(mealJson);
        }).toList();
    return cakes;
  }
}
