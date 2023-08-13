// Flutter and material design widgets and services library
import 'package:flutter/material.dart';

// Defining a new Widget, DetailScreen which is a fully interactive item
class DetailScreen extends StatelessWidget {
  // A form of parameter you can pass to your Widget's constructor
  final dynamic character;

  // Constructor for this class
  DetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It splits the string at ' - ' and saves the first part as _name and the second part as _description
    var splitText = character['Text'].split(" - ");
    String _name = splitText[0];
    String _description = splitText[1];
    // Fetching the image URL  
    String imageUrl = character['Icon']['URL'];

    // Return Scaffold widget to show appbar and body of the screen
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("${character['Text'].split(" - ")[0]} Details")),
      ),
      // The main functional widget which include image and information of characters
      body: Container(
        // Applying color to the screen
        color: Colors.yellow.shade100, 
        child: Padding(
          padding: EdgeInsets.all(16.0), // Add padding
          // Using Column to organize widgets vertically
          child: Column(
              // MainAxisAlignment.center will align the children widget to center
              mainAxisAlignment: MainAxisAlignment.center,
              // CrossAxisAlignment.center will make the children align to center horizontally
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: <Widget>[
                // If no imageUrl found, a default imageUrl placed
                imageUrl == "" 
                    ? Image.network("https://upload.wikimedia.org/wikipedia/en/0/0d/Simpsons_FamilyPicture.png")
                    : Image.network("https://duckduckgo.com" + imageUrl),
                SizedBox(height: 8), // Add a vertical spacing
                // Showing name of the character
                Text("Name: $_name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                SizedBox(height: 8), // Add a vertical spacing
                // Showing description of the character
                Text("Description: $_description", style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
              ]),
        ),
      ),
    );
  }
}