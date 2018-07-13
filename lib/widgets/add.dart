import 'package:flutter/material.dart';
import 'addNoun.dart';
import 'addVerb.dart';

class Add extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddState();
}

class _AddState extends State<Add> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: AppBar(
            title: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Noun',),
                Tab(text: 'Verb',),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              new AddNoun(),
              new AddVerb(),
            ],
          ),
      );
  }
}
