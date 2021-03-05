
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
      await http.get('http://localhost:8080/1');

  // response.body is a John object
  if (response.statusCode == 200) {
    // json.decode(response.body), parse the JSON,convert the JSON to map structure
    //Map<String, dynamic> user = json.decode(json);
    //print('Howdy, ${user['name']}!');
   // print('We sent the verification link to ${user['email']}.');

    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  
  final String id;
  final String fleetID;
  final String type;

  Post({this.id, this.fleetID, this.type});

 // a new User data instance is created from a map structure. to hold the data
 //A User.fromJson constructor, for constructing a new User instance from a map structure.
 //A toJson method, which converts a User instance into a map.
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      fleetID: json['fleetID'],
      type: json['type'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(

            // get the data from a model instance
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  // sanpshot is from the model instance
                  snapshot.data.fleetID,
                  style: new TextStyle(color: Colors.red ,fontWeight: FontWeight.bold, fontSize:50.0)
                  );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}",
                );
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}