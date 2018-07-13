import 'package:flutter/material.dart';

class AddVerb extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddVerbState();
}

class _AddVerbState extends State<AddVerb> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
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
    print('pressed');
  }
}
