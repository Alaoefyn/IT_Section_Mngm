//database_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  // Private constructor
  DatabaseHelper._internal();

  // Getter for the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'it_management.db');
    return await openDatabase(
      path,
      version: 2, // Increment version if there are changes in the schema
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create tables
    await db.execute('''
      CREATE TABLE devices (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        serialNumber TEXT,
        dateAdded TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE maintenance_need_computers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        deviceId INTEGER,
        issueDescription TEXT,
        reportedDate TEXT,
        FOREIGN KEY (deviceId) REFERENCES devices(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE project_meeting_dates (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        projectName TEXT,
        meetingDate TEXT,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE active_jobs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        jobName TEXT,
        assignedTo TEXT,
        startDate TEXT,
        dueDate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE finished_jobs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        jobName TEXT,
        assignedTo TEXT,
        completionDate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE desires_from_other_departments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        departmentName TEXT,
        desireDescription TEXT,
        requestDate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE components (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        status TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE support_requests (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userName TEXT,
        issue TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE equipments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        department TEXT
      )
    ''');
  }

  // CRUD operations for the new tables

  // Components CRUD methods
  Future<void> insertComponent(Map<String, dynamic> component) async {
    final db = await database;
    await db.insert('components', component);
  }

  Future<List<Map<String, dynamic>>> getComponents() async {
    final db = await database;
    return await db.query('components');
  }

  Future<void> updateComponent(int id, Map<String, dynamic> component) async {
    final db = await database;
    await db.update(
      'components',
      component,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteComponent(int id) async {
    final db = await database;
    await db.delete(
      'components',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Support Requests CRUD methods
  Future<void> insertSupportRequest(Map<String, dynamic> request) async {
    final db = await database;
    await db.insert('support_requests', request);
  }

  Future<List<Map<String, dynamic>>> getSupportRequests() async {
    final db = await database;
    return await db.query('support_requests');
  }

  Future<void> updateSupportRequest(int id, Map<String, dynamic> request) async {
    final db = await database;
    await db.update(
      'support_requests',
      request,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteSupportRequest(int id) async {
    final db = await database;
    await db.delete(
      'support_requests',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Equipments CRUD methods
  Future<void> insertEquipment(Map<String, dynamic> equipment) async {
    final db = await database;
    await db.insert('equipments', equipment);
  }

  Future<List<Map<String, dynamic>>> getEquipments() async {
    final db = await database;
    return await db.query('equipments');
  }

  Future<void> updateEquipment(int id, Map<String, dynamic> equipment) async {
    final db = await database;
    await db.update(
      'equipments',
      equipment,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteEquipment(int id) async {
    final db = await database;
    await db.delete(
      'equipments',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Additional CRUD methods can be added here...
}
