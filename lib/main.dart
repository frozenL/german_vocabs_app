import 'package:flutter/material.dart';
import 'widgets/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ah hah',
      home: new Home(),
      theme: ThemeData(
        primaryColor: Colors.indigo[400],
      ),
    );
  }
}
