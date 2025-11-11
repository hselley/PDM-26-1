// sqlite.dart

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      home: SQLiteDemo(),
    );
  }
}

class SQLiteDemo extends StatefulWidget {
  @override
  _SQLiteDemoState createState() => _SQLiteDemoState();
}

class _SQLiteDemoState extends State<SQLiteDemo> {
  // Variables de estado
  late Database _db;
  List<Map<String, dynamic>> _usuarios = [];
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), 'usuarios.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE usuarios(id INTEGER PRIMARY AUTOINCREMENT, nombre TEXT, email TEXT)',
        );
      }
    );
    _loadUsuarios();
  }

  _loadUsuarios() async {
    List<Map<String, dynamic>> usuarios = await _db.query('usuarios');
    setState(() {
      _usuarios = usuarios;
    });
  }

  _addUsuario() async {
    if(_nombreController.text.isNotEmpty && _emailController.text.isNotEmpty) {
      await _db.insert('usuarios', {
        'nombre': _nombreController.text,
        'email': _emailController.text,
      });
      _loadUsuarios();
      _nombreController.clear();
      _emailController.clear();
    }
  }

  _deleteUsuario(int id) async {
    await _db.delete('usuarios', where: 'id = ?', whereArgs: [id]);
    _loadUsuarios();
  }

  // Vista
}