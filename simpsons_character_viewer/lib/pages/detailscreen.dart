import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final dynamic character;

  DetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var splitText = character['Text'].split(" - ");
    String _name = splitText[0];
    String _description = splitText[1];
    String imageUrl = character['Icon']['URL'];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("${character['Text'].split(" - ")[0]} Details")),
      ),
      body: Container(
        color: Colors.yellow.shade100, // Added this to change the background color
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // This makes the items in column to center
              crossAxisAlignment: CrossAxisAlignment.center, // This makes the items in row to center
              children: <Widget>[
                imageUrl == ""
                    ? Image.network("https://upload.wikimedia.org/wikipedia/en/0/0d/Simpsons_FamilyPicture.png")
                    : Image.network("https://duckduckgo.com" + imageUrl),
                SizedBox(height: 8),
                Text("Name: $_name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                SizedBox(height: 8),
                Text("Description: $_description", style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
              ]),
        ),
      ),
    );
  }
}