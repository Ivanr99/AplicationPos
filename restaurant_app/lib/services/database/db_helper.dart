import 'dart:async';
import 'package:restaurant_app/models/mesa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  // Inicializa la base de datos
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  // Crea la base de datos
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'mesas.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE mesas(id INTEGER PRIMARY KEY, nombre TEXT, estado TEXT)',
      );
    }, version: 1);
  }

  // Inserta una nueva mesa en la base de datos
  Future<void> insertarMesa(Mesa mesa) async {
    final db = await database;
    await db.insert(
      'mesas',
      mesa.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.replace, // Si la mesa ya existe, la reemplaza
    );
  }

  // Obtiene todas las mesas de la base de datos
  Future<List<Mesa>> obtenerMesas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('mesas');
    return List.generate(maps.length, (i) {
      return Mesa(
        id: maps[i]['id'],
        nombre: maps[i]['nombre'],
        estado: maps[i]['estado'],
      );
    });
  }

  // Actualiza el estado de una mesa
  Future<void> actualizarEstado(Mesa mesa) async {
    final db = await database;
    await db.update(
      'mesas',
      mesa.toMap(),
      where: 'id = ?',
      whereArgs: [mesa.id],
    );
  }

  // Elimina una mesa
  Future<void> eliminarMesa(int id) async {
    final db = await database;
    await db.delete(
      'mesas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
