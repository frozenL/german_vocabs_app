import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class AddNoun extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddNounState();
}

class _AddNounState extends State<AddNoun> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Center(child: Text('gender')),
        Center(
            child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Please enter a gender'),
        )),
        Center(child: Text('term')),
        Center(
            child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Please enter a term'),
        )),
        Center(child: Text('English')),
        Center(
            child: TextField(
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
    _counter ++;
    writeCounter(_counter);
    readCounter().then((int val) {
      print(val);
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      // If we encounter an error, return 0
      return 0;
    }
  }
}
