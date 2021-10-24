import 'package:flutter/material.dart';
import 'package:pass_reminder/dtos/Access.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class AccessListPage extends StatefulWidget {
  AccessListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AccessListPageState createState() => _AccessListPageState();
}

class _AccessListPageState extends State<AccessListPage> {
  List<Access> _accesses = <Access>[];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/accesses.json');
    List<dynamic> data = await json.decode(response);
    setState(() {
      _accesses = data.map((access) => Access.fromJson(access)).toList();
    });
  }

  void _addNewAccess() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Not implemented yet"),
    ));
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _createListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewAccess,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _createListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _accesses.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => _openSelectedAccess(_accesses[index]),
              child: Container(
                height: 50,
                color: Colors.grey[200],
                child: Center(child: Text('${_accesses[index].accessName}')),
              ));
        });
  }

  
  Future<void> _openSelectedAccess(Access selectedAccess) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${selectedAccess.accessName}'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('User: ${selectedAccess.username}'),
              Text('Password: ${selectedAccess.password}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}
