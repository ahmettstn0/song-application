import 'package:flutter/material.dart';
import 'package:spotify_application/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class User {
  int? id;
  String username;
  String email;
  String password;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;
  static String? _databasePath;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path, 'song.db');
  
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE User(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> insertUser(String username, String email, String password) async {
    final db = await database;
    await db.insert(
      'User',
      {'username': username, 'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

Future<User?> getUserByEmailAndPassword(String email, String password) async {
  final db = await database;
  List<Map<String, dynamic>> maps = await db.query(
    'User',
    where: 'email = ? AND password = ?',
    whereArgs: [email, password],
  );

  if (maps.isNotEmpty) {
    return User(
      id: maps[0]['id'],
      username: maps[0]['username'],
      email: maps[0]['email'],
      password: maps[0]['password'],
    );
  } else {
    return null;
  }
}
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String dbPath = join(appDocDir.path, 'song.db');
  print('Database Path: $dbPath');
  await DatabaseHelper()._initDatabase(); 
  runApp(MyApp());
}
