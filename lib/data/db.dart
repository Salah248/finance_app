import 'package:finance_app/data/model.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'auth';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('DbHelper: _db is not null');
      return;
    } else {
      try {
        final String path = '${await getDatabasesPath()}_auth.db';
        debugPrint('path: $path');
        _db = await openDatabase(
          path,
          version: _version,
          onCreate: (db, version) async {
            debugPrint('created db');
            await db.execute(
              'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT, email TEXT, password TEXT)',
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insertAuthData(RegisterModel model) async {
    debugPrint('inserted');
    return await _db!.insert(_tableName, model.toMap());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    debugPrint('queried');
    return await _db!.query(_tableName);
  }

  static Future<RegisterModel?> getUserByEmailAndPassword(
    String email,
    String password,
  ) async {
    final List<Map<String, dynamic>> result = await _db!.query(
      _tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return RegisterModel.fromMap(result.first);
    } else {
      return null;
    }
  }

  static Future<RegisterModel?> getUsername(String? userName) async {
    if (userName == null) return null;
    final List<Map<String, dynamic>> result = await _db!.query(
      _tableName,
      where: 'userName = ?',
      whereArgs: [userName],
    );

    if (result.isNotEmpty) {
      return RegisterModel.fromMap(result.first);
    } else {
      return null;
    }
  }
}
