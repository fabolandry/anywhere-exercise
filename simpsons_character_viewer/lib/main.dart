// It is a best practice to import packages at the very top
import 'package:flutter/material.dart';
import 'package:simpsons_character_viewer/pages/listscreen.dart';

// This is the main method, the entry-point of a Flutter application
void main() => runApp(MyApp());

// MyApp widget is a root widget of whole app
class MyApp extends StatelessWidget {
  // The list of API URLs
  static List<String> urls = [
    'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
    'http://api.duckduckgo.com/?q=the+wire+characters&format=json'
  ];
  
  // This method describes the part of the user interface the widget will present
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a pre-defined class which becomes the root of your application
    return MaterialApp(
      title: 'Simpson Characters Viewer',
      // Theme configuration of the Flutter app
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      // Gets rid of the debug tag in the upper right corner
      debugShowCheckedModeBanner: false,
      // The widget that will be shown on the home screen of the app
      home: ListScreen(url: urls[0],appName: 'Simpson Characters Viewer'),
    );
  }
}