import 'dart:async';
import 'dart:io' as io;
import 'package:mine_plod/model/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

 

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "wang.db");
    // we have to give sqflite access to the _onCreate method so that it can be call when it is initialized
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, dob TEXT)");
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }

  Future<List<User>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    List<User> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new User(list[i]["firstname"], list[i]["lastname"], list[i]["dob"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);

    // get the all of the records in the user table
    return employees;
  }

// get the record with the specified id
 Future<User> fetchUser(int id) async {
    List<Map> results = await _db.query("user", columns: User.columns, where: "id = ?", whereArgs: [id]);

    if(results.length > 0)
    {
       User user = User.fromMap(results.first);
      return user;
    }
    else
    {
      return null;

    }
  }

  Future<int> deleteUsers(User user) async {
    var dbClient = await db;

    int res = await dbClient.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(User user) async {
    var dbClient = await db;
    int res =   await dbClient.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }
}