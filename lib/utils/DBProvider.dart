import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider dbProvider = DBProvider._();

  static Database _database;
   Future<Database> get database async {


   }
}