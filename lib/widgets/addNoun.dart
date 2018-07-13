import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../database/database.dart';

class AddNoun extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddNounState();
}

class _AddNounState extends State<AddNoun> {
  String _dbPath;
  Database _db;
  final genderController = TextEditingController();
  final gerController = TextEditingController();
  final engController = TextEditingController();

  void insertNoun(gender, ger, eng) async {
    await _db.transaction((txn) async {
      txn.rawInsert('INSERT INTO Noun (gender, ger, eng) VALUES (?, ?, ?)',
          ['$gender', '$ger', '$eng']);
    });
    List<Map> list = await _db.rawQuery('SELECT * FROM Noun');
    print(list);
  }

  void initDb() async {
    _dbPath = await initDeleteDb('germanApp');
    _db = await openDatabase(_dbPath);
    await _db.execute(
        "CREATE TABLE Noun (id INTEGER PRIMARY KEY, gender TEXT, ger TEXT, eng TEXT)");
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Center(child: Text('gender')),
        Center(
            child: TextField(
          controller: genderController,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Please enter a gender'),
        )),
        Center(child: Text('term')),
        Center(
            child: TextField(
              controller: gerController,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Please enter a term'),
        )),
        Center(child: Text('English')),
        Center(
            child: TextField(
              controller: engController,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Please enter a translation'),
        )),
        Center(child: Text('Please submit')),
        Center(
          child: FlatButton(
            color: Theme.of(context).primaryColor,
            onPressed: onPressed,
            child: Text('submit'),
          ),
        ),
      ],
    );
  }

  void onPressed() {
    insertNoun(genderController.text, gerController.text, engController.text);
    genderController.clear();
    gerController.clear();
    engController.clear();
  }
}
