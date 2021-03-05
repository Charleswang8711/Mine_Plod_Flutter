import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'SecScreen.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'page wang First',
      home: const MyHomePage(title: 'page wang First'),// becomes the route named '/'
      routes: <String, WidgetBuilder> {

      '/Sec': (BuildContext context) => new SecondScreen(title: 'page wang Second'),
      // '/b': (BuildContext context) => new MyPage(title: 'page B'),
      // '/c': (BuildContext context) => new MyPage(title: 'page C'),
    },
    );
  }
}

// we do not need to change the data by itslef own widget or by other child widget. all the data(state) comes from or go to database.
// So we just present all the data, we chooose a stateless widget
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

   @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new StreamBuilder(
          // streambuilder is sort of a list which has a content and index
          stream: Firestore.instance.collection('baby').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              padding: const EdgeInsets.only(top: 10.0),
              itemExtent: 55.0,
              itemBuilder: (context, index) =>  buildListItem(context: context, docsnapshot: snapshot.data.documents[index]),
              
            );
          }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: () {
            Navigator.pushNamed(context, '/Sec');
          },
      ),
    
     

    );
  }
}


class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

  // create a private method widget
  class buildListItem extends StatelessWidget {

    // pass data by child widget construtor
    const buildListItem({this.context, this.docsnapshot});

    final BuildContext context;
    final DocumentSnapshot docsnapshot;
    @override

    Widget build(BuildContext context) {
      return new ListTile(
    key: new ValueKey(docsnapshot.documentID),
    title: new Container(
      decoration: new BoxDecoration(
        border: new Border.all(color: const Color(0x80000000)),
        borderRadius: new BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(docsnapshot['name']),
          ),
          new Text(
            docsnapshot['votes'].toString(),
          ),
        ],
      ),
    ),
    onTap: () => Firestore.instance.runTransaction((transaction) async {
          DocumentSnapshot freshSnap = 
              await transaction.get(docsnapshot.reference);
          await transaction.update(
              freshSnap.reference, {'votes': freshSnap['votes'] + 1});
        }),
  );
    }
  }

//   Widget buildListItem(BuildContext context, DocumentSnapshot document) {
//   return new ListTile(
//     key: new ValueKey(document.documentID),
//     title: new Container(
//       decoration: new BoxDecoration(
//         border: new Border.all(color: const Color(0x80000000)),
//         borderRadius: new BorderRadius.circular(5.0),
//       ),
//       padding: const EdgeInsets.all(10.0),
//       child: new Row(
//         children: <Widget>[
//           new Expanded(
//             child: new Text(document['name']),
//           ),
//           new Text(
//             document['votes'].toString(),
//           ),
//         ],
//       ),
//     ),
//     onTap: () => Firestore.instance.runTransaction((transaction) async {
//           DocumentSnapshot freshSnap = 
//               await transaction.get(document.reference);
//           await transaction.update(
//               freshSnap.reference, {'votes': freshSnap['votes'] + 1});
//         }),
//   );
// }

 
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Screen"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }