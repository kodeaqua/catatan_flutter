import 'dart:io';
import 'package:ngabuburit3/models/catatan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'catatan.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE catatan(id INTEGER PRIMARY KEY, title TEXT, body TEXT, timestamp STRING)''');
  }

  Future<List<Catatan>> getCatatan() async {
    Database db = await instance.database;
    var notes = await db.query('catatan', orderBy: 'title');
    List<Catatan> noteList =
        notes.isNotEmpty ? notes.map((e) => Catatan.fromMap(e)).toList() : [];
    return noteList;
  }

  Future<int> add(Catatan catatan) async {
    Database db = await instance.database;
    return await db.insert('catatan', catatan.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('catatan', where: 'id = ?', whereArgs: [id]);
  }
}
