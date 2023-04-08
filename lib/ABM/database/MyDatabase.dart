import 'dart:io';

import 'package:my_app/ABM/Models/tenant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  static final MyDataBase _myDataBase = MyDataBase._privateConstructor();
  //provide constroctor
  MyDataBase._privateConstructor();
//database
  static late Database _database;
  factory MyDataBase() {
    return _myDataBase;
  }
  //variables
  final String tableName = 'table_name';
  final String coloumId = 'id';
  final String coloumAssetName = 'assetname';
  final String coloumAssetType = "asset_type";
  final String coloumPurchaseDate = "purchaedate";
  final String coloumQRcode = "QRcode";
  //
  //init database
  initializedDatabase() async {
    //Get path where to store database

    Directory directory = await getApplicationDocumentsDirectory();
    //path
    String path = '${directory.path}table_name.db';
    //create database
    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      //
      db.execute(
          'CREATE TABLE $tableName ($coloumId INTEGER PRIMARY KEY, $coloumAssetName TEXT, $coloumAssetType INTEGER, $coloumPurchaseDate TEXT,$coloumQRcode TEXT)');
      //
    });
  }

//CRUD
//READ
  Future<List<Map<String, Object?>>> getFlatOwnerlist() async {
    //
    //List<Map<String,Object?>> result=await _database.rawQuery('SELECT * FROM $tableName');
    List<Map<String, Object?>> result =
        await _database.query(tableName, orderBy: coloumAssetName);
    return result;

    //
  }

  //Insert
  Future<int> insertFlatOwnerlist(Tenant tenant) async {
    //

    int rowsInserted = await _database.insert(tableName, tenant.toMap());
    return rowsInserted;

    //
  }

//Update/edit
  Future<int> UpdateFlatOwnerlist(Tenant tenant) async {
    //

    int rowsUpdate = await _database.update(tableName, tenant.toMap(),
        where: '$coloumId=?', whereArgs: [tenant.id]);
    return rowsUpdate;

    //
  }

  //Delete
  Future<int> deleteFlatOwnerlist(Tenant tenant) async {
    //

    int rowsdeleted = await _database
        .delete(tableName, where: '$coloumId=?', whereArgs: [tenant.id]);
    return rowsdeleted;

    //
  }

  //Count
  Future<int> countFlatOwnerlist() async {
    //

    List<Map<String, Object?>> result =
        await _database.rawQuery('SELECT COUNT(*) FROM $tableName');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count;

    //
  }

  ///
  ///text search
  Future<List<Map<String, Object?>>> searchFlatOwnerlist(String flatNo) async {
    List<Map<String, Object?>> result = await _database
        .query(tableName, where: '$coloumId LIKE ?', whereArgs: ['%$flatNo%']);
    return result;
  }

  /////
}
