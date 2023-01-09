import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tic_tac_toe/data/x_o_model.dart';


class XODATABASE {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'XODataTable.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE XODataTable( id INTEGER PRIMARY KEY AUTOINCREMENT, 
              padNumber int NOT NULL,
              playerSide TEXT NOT NULL,
              playerIcon TEXT NOT NULL)''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertTask(XOModel task) async {
    Database db = await database();
    int data = await db.insert('XODataTable', task.toMap());
    return data;
  }

  Future<List<XOModel>> getTasks() async {
    Database db = await database();
    var tasks = await db.query('XODataTable');
    List<XOModel> tasksList = tasks.isNotEmpty
        ? tasks.map((e) => XOModel.fromMap(e)).toList()
        : [];
    return tasksList;
  }

  Future<bool> updateTaskList(XOModel item) async {
    final Database db = await database();
    final rows = await db.update(
      'XODataTable',
      item.toMap(),
      where: 'padNumber = ?',
      whereArgs: [item.padNumber],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return rows > 0;
  }

  Future<void> deleteTask() async {
    Database db = await database();
    await db.delete("XODataTable");
  }
}
