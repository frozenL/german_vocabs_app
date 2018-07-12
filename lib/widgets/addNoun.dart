import 'package:flutter/material.dart';

class AddNoun extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddNounState();
}

class _AddNounState extends State<AddNoun> {
  @override
  Widget build(BuildContext context) {
    /*
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.kitchen, color: Colors.green[500]),
              Text('PREP:'),
              Text('25 min'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.timer, color: Colors.green[500]),
              Text('COOK:'),
              Text('1 hr'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.restaurant, color: Colors.green[500]),
              Text('FEEDS:'),
              Text('4-6'),
            ],
          ),
        ],
      )
    ]);
    */
    return Center(child: Column(
      children: [
        Row(children: [Text('German')]),
        Row(
          children: [
            Text('gender'),
            Flexible(
                child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please enter a search term'),
            )),
          ],
        ),
        Row(
          children: [
            Text('term'),
            Flexible(
                child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please enter a search term'),
            )),
          ],
        ),
        Row(
          children: [
            Text('English'),
            Flexible(
                child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please enter a search term'),
            )),
          ],
        ),
        Row(children: [
          FlatButton(
            onPressed: null,
            child: Text('submit'),
          ),
        ]),
      ],
    ));
  }
}
