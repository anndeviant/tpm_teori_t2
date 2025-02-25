import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user.dart';

class DatabaseHelper {
  final databaseName = "calc.db";
  String users =
      "CREATE TABLE users( userId INTEGER PRIMARY KEY AUTOINCREMENT, fullname TEXT NOT NULL, email TEXT NOT NULL UNIQUE, password TEXT NOT NULL)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(users);
      },
    );
  }

  // Login Method
  Future<bool> login(Users user) async {
    final db = await initDB();
    var result = await db.rawQuery(
      "SELECT * FROM users WHERE email = '${user.email}' AND password = '${user.password}'",
    );

    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> regist(Users user) async {
    final db = await initDB();
    return await db.insert("users", user.toMap());
  }
}
