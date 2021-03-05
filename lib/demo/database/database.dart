import 'dart:async';
import 'dart:io' as io;
import 'package:mine_plod/demo/model/model_fleet.dart';
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
    String path = join(documentsDirectory.path, "MinePlod.db");
    // we have to give sqflite access to the _onCreate method so that it can be call when it is initialized
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Fleet(id INTEGER PRIMARY KEY, fleetID TEXT, type TEXT, startDate TEXT, endDate TEXT)");

    // await db.execute("""
    //         CREATE TABLE Fleet (
    //           id INTEGER PRIMARY KEY,
    //           fleetID TEXT NOT NULL UNIQUE,
    //           type TEXT NOT NULL,
    //           startDate TEXT,
    //           endDate TEXT,
    //         )""");
  }

  Future<int> saveFleet(Fleet fleet) async {
    var dbClient = await db;
    // return a id with increament squence number + 1 
     int res = await dbClient.insert("Fleet", fleet.toMap());
    return res ;
  }

  Future<List<Fleet>> getFleet() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Fleet');
    List<Fleet> fleets = new List();
    for (int i = 0; i < list.length; i++) {
      var fleet =
          new Fleet(list[i]["fleetID"], list[i]["type"], list[i]["startDate"],list[i]["endDate"]);

      // get id form database, we will use it when we edit and updata the record 
      fleet.setFleetId(list[i]["id"]);
      fleets.add(fleet);
    }
    print(fleets.length);

    // get the all of the records in the Fleet table
    return fleets;
  }

  Future<int> deleteFleets(Fleet fleet) async {
    var dbClient = await db;
    int res =
        await dbClient.rawDelete('DELETE FROM Fleet WHERE id = ?', [fleet.id]);
    return res;
  }

  Future<bool> update(Fleet fleet) async {
    var dbClient = await db;
    int res =   await dbClient.update("Fleet", fleet.toMap(),
        where: "id = ?", whereArgs: <int>[fleet.id]);
    return res > 0 ? true : false;
  }
}