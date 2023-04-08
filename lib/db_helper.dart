import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'modals.dart';

class DatabaseHelper {
  
  static Future<void> createTables(sql.Database database) async {
    // creating table
    await database.execute(""" 
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,  
        companyname TEXT,
        catagories TEXT,
        year INTEGER
      )
    """);
  }

  static Future<sql.Database> db() async {
    // database creation ....
    return sql.openDatabase(
      'experimental.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> addUser(User user) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('users', user.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<User>> getUsers() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        companyname: maps[i]['companyname'],
        catagories: maps[i]['catagories'],
        year: maps[i]['year'],
      );
    });
  }

  static Future<User> getUser(int id) async {
    //fetching data through id of table user
    final dbClient = await db();
    final maps =
        await dbClient.query('users', where: 'id = ?', whereArgs: [id]);
    return User.fromMap(maps.first);
  }


//   static Future<void> updateUser(int id, User user) async {
//   final dbClient = await db();
//   await dbClient.update(
//     'users',
//     user.toMap(),
//     where: 'id = ?',
//     whereArgs: [id],
//   );
// }

// static Future<int> updateUser(int id, User user) async {
//   final db = await database;
//   return await db.update(
//     tableUser,
//     user.toMap(),
//     where: '$columnId = ?',
//     whereArgs: [id],
//   );
// }


// static Future<int> updateUser(int id, User user) async {
//   final dbClient = await db();
//   await dbClient.update(
//     'users',
//     user.toMap(),
//     where: 'id = ?',
//     whereArgs: [id],
//   );
//   //return user;
// }


// static FutureOr<User?> updateUser(int id, User user) async {
//   final dbClient = await db();
//   int rowsUpdated = await dbClient.update(
//     'users',
//     user.toMap(),
//     where: 'id = ?',
//     whereArgs: [id],
//   );
//   if (rowsUpdated > 0) {
//     return user;
//   } else {
//     return null;
//   }
// }


static Future<int> updateUser(int id, User user) async {
  final dbClient = await db();
  return dbClient.update(
    'users',
    user.toMap(),
    where: 'id = ?',
    whereArgs: [id],
  );
}



static Future<int> deleteUser(int id) async {
  final dbClient = await db();
  return await dbClient.delete(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
}








}


// static Future<List<User>> getUsers() async {
  //   final dbClient = await db();
  //   final List<Map<String, dynamic>> maps = await dbClient.query('users');
  //   return List.generate(maps.length, (i) => User.fromMap(maps[i]));
  // }


//}


// class DatabaseHelper {
//   static Future<void> createTables(sql.Database database) async {
//     await database.execute(""" CREATE TABLE users(
//         id INTEGER PRIMARY KEY,
//         name TEXT,
//         age INTEGER,
//         email TEXT
//       )
//       """);
//   }


//   static Future<sql.Database> db() async {
//     return sql.openDatabase(
//       'experimental.db',
//       version: 1,
//       onCreate: (sql.Database database, int version) async {
//         await createTables(database);
//       },
//     );
//   }


// Future<void> updatePerson(int id, String name, int age) async {
//   final db = await db();
//   await db.update(
//     'person', // table name
//     {'name': name, 'age': age}, // columns to new values
//     where: 'id = ?', // where clause
//     whereArgs: [id], // values to replace the placeholders in the where clause
//   );






// Future<int> updateUser(User user) async {
//   // Get a reference to the database.
//   DatabaseHelper db = await this.db;
  
//   // Update the user's data in the database.
//   int result = await db.update(
//     user,
//     user.toMap(),
//     where: '$colId = ?',
//     whereArgs: [user.id],
//   );
  
//   return result;
// }

  

  //   static Future<int> addUser(User user) async {
//     final dbClient = await db();
//     return dbClient.insert('users', user.toMap());
//   }