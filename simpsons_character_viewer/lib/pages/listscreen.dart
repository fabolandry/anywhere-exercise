// Import the required libraries
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detailscreen.dart';

// ListScreen Widget that displays a list of characters from the API data
class ListScreen extends StatelessWidget {
  // Declare the required variables
  final String url; //API endpoint
  final String appName; //Name of the App

  // Constructor
  ListScreen({Key? key, required this.url, required this.appName})
      : super(key: key);

  // Fetch the character data from the API in an asynchronous function
  Future<List<dynamic>> fetchCharacter() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body)['RelatedTopics'];
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  // Build widget for the ListScreen class
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCharacter(), // fetch characters in a FutureBuilder
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          // If characters are fetched, return display list, else return loading
          return snapshot.hasData
              ? CharacterList(characters: snapshot.data!)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// Custom Widget to show a Character list
class CharacterList extends StatelessWidget {
  final List<dynamic> characters; // list of characters to be shown

  // Constructor
  CharacterList({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ListView.builder is used to create the list
    return ListView.builder(
      itemCount: characters == null ? 0 : characters.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 5,
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text(
              characters[index]['Text'].split(" - ")[0], //get name from API data
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            // Navigate to DetailScreen when a list tile is tapped
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(character: characters[index])),
              );
            },
          ),
        );
      },
    );
  }
}