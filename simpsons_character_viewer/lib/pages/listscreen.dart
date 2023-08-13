import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detailscreen.dart';

class ListScreen extends StatelessWidget {
  final String url;
  final String appName;

  ListScreen({
    Key? key, 
    required this.url,
    required this.appName
  }) : super(key: key);

  Future<List<dynamic>> fetchCharacter() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body)['RelatedTopics']; 
  } else {
    throw Exception('Failed to load characters');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCharacter(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CharacterList(characters: snapshot.data!)
              : Center(child: CircularProgressIndicator()); //return loading screen when no data
        },
      ),
    );
  }
}

class CharacterList extends StatelessWidget {
  final List<dynamic> characters;

  CharacterList({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters == null ? 0 : characters.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 5,
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text(
              characters[index]['Text'].split(" - ")[0],
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(character: characters[index])),
              );
            }
          ),
        );
      },
    );
  }
}