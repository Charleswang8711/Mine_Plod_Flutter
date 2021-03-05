
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  // response.body is a John object
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON,convert the JSON to map structure
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

 // a new User data instance is created from a map structure. to hold the data
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
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
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
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

// get the data into a dart normal variable

// new RaisedButton(
//                   onPressed: _getRandomQuote,
//                   child: new Text('Get a Random Quote'),
//                 ),

// _getRandomQuote() async {
//   final response =
//       await http.get('https://jsonplaceholder.typicode.com/posts/1');

//       String str;
//   // response.body is a John object
//   if (response.statusCode == 200) {

    
//     // If the call to the server was successful, parse the JSON,convert the JSON to map structure
//      str = Post.fromJson(json.decode(response.body)).title;
//   } else {
//     // If that call was not successful, throw an error.
//     throw Exception('Failed to load post');
//   }
// }

// class Post {
//   final int userId;
//   final int id;
//   final String title;
//   final String body;

//   Post({this.userId, this.id, this.title, this.body});

//  // a new User data instance is created from a map structure. to hold the data
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }

//------------------------------------------------------------------------------------------------------

// the other option to read data from the webapi

// Future<List> getData() async {
//     List data = new List();
//     var httpClient = new HttpClient();
//     var request = await httpClient.get("localhost", 5000, '/search?query=hello');
//     var response = await request.close();
//     if (response.statusCode == HttpStatus.OK) {
//       var jsonString = await response.transform(utf8.decoder).join();
//       data = json.decode(jsonString);
//       print(data);
//       return data;
//     } else {
//       return data;
//     }
//   }