import 'package:flutter/material.dart';
import 'package:simpsons_character_viewer/pages/listscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  static List<String> urls = [
    'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
    'http://api.duckduckgo.com/?q=the+wire+characters&format=json'
  ];
  
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simpson Characters Viewer',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: ListScreen(url: urls[0],appName: 'Simpson Characters Viewer'),
    );
  }
}