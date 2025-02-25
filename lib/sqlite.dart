import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user.dart';

class DatabaseHelper {
  final databaseName = "data1.db";
  String users =
      "create table users (userId INTEGER PRIMARY KEY AUTOINCREMENT, fullname TEXT, email TEXT UNIQUE, password TEXT)";
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
    });
  }

  // Login Method
  Future<bool> login(Users user) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from users where email = '${user.email}' AND password = '${user.password}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> regist(Users user) async {
    final Database db = await initDB();

    return db.insert("users", user.toMap());
  }
}
