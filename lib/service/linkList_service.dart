import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/short_url_model.dart';

class LinkListService {
  static final LinkListService instance = LinkListService._init();
  static Database? _database;
  LinkListService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb('linkList.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableLink(
  ${LinkFields.id} $idType,
  ${LinkFields.title} $textType,
  ${LinkFields.date} $textType,
  ${LinkFields.shortUrl} $textType,
  ${LinkFields.longUrl} $textType

)

''');
  }

  Future<DataLink> create(DataLink link) async {
    final db = await instance.database;

    final id = await db.insert(tableLink, link.toJson());

    return link.copy(id: id);
  }

  Future<DataLink> readNotes(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableLink,
        columns: LinkFields.values,
        where: '${LinkFields.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return DataLink.fromJson(maps.first);
    } else {
      throw Exception('Id $id is not found');
    }
  }

  Future<List<DataLink>> readAllLink() async {
    final db = await instance.database;

    final orderBy = '${LinkFields.date} ASC';
    final result = await db.query(tableLink, orderBy: orderBy);

    return result.map((json) => DataLink.fromJson(json)).toList();
  }

  Future<int> update(DataLink link, int id) async {
    final db = await instance.database;

    return db.update(tableLink, link.toJson(),
        where: '${LinkFields.id} = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db
        .delete(tableLink, where: '${LinkFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
