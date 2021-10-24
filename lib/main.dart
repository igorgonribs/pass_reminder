import 'package:flutter/material.dart';
import './pages/AccessListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey, accentColor: Colors.grey.shade900),
      home: AccessListPage(title: 'My Accesses'),
    );
  }
}

