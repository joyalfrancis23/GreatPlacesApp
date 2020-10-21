
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';//for accessing the DataBase abstract class

class DbHelper{
  static Future<Database> dataBase() async //contains database path setting,opening a database and executing a database
  {
    final dataBase = await sql.getDatabasesPath();//sets a default database path
    return sql.openDatabase(path.join(dataBase.toString(),'palace.db'),onCreate: (db,version)//opens database the "path." is the path package imported form the path provinding package ".join" helps to join the two path one provided by the path package and other provider by default by the sql package
    {
      db.execute('CREATE TABLE userPlaces(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    },version: 1);
  }
  static Future<void> insertinDataBase(String table, Map<String ,Object> data) async 
  {
    final db = await DbHelper.dataBase();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace );
  }
  static Future<List<Map<String,Object>>> getData(String table)async{
    final db = await DbHelper.dataBase();
    return db.query(table);
  }
}