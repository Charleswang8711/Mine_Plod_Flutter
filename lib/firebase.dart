import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Baby Names',
      home: const MyHomePage(title: 'Baby Name Votes'),
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
              itemBuilder: (context, index) =>  _buildListItem(context, snapshot.data.documents[index]),
              
            );
          }),
    );
  }

  // create a private method widget

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return new ListTile(
    key: new ValueKey(document.documentID),
    title: new Container(
      decoration: new BoxDecoration(
        border: new Border.all(color: const Color(0x80000000)),
        borderRadius: new BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(document['name']),
          ),
          new Text(
            document['votes'].toString(),
          ),
        ],
      ),
    ),
    onTap: () => Firestore.instance.runTransaction((transaction) async {
          DocumentSnapshot freshSnap = 
              await transaction.get(document.reference);
          await transaction.update(
              freshSnap.reference, {'votes': freshSnap['votes'] + 1});
        }),
  );
}

 
}

// add a new DocumentReference
// Firestore.instance.collection('books').document()
//   .setData({ 'title': 'title', 'author': 'author' });

//Binding a CollectionReference to a ListView:

// 

// Performing a query:
// Firestore.instance
//     .collection('talks')
//     .where("topic", isEqualTo: "flutter")
//     .snapshots()
//     .listen((data) =>
//         data.documents.forEach((doc) => print(doc["title"])));
//Running a transaction:

// final DocumentReference postRef = Firestore.instance.document('posts/123');
// Firestore.instance.runTransaction((Transaction tx) async {
//   DocumentSnapshot postSnapshot = await tx.get(postRef);
//   if (postSnapshot.exists) {
//     await tx.update(postRef, <String, dynamic>{'likesCount': postSnapshot.data['likesCount'] + 1});
//   }
// });

// db.collection("cities").whereEqualTo("state", "CA")
//         .addSnapshotListener(new EventListener<QuerySnapshot>() {
//             @Override
//             public void onEvent(@Nullable QuerySnapshot querySnapshot,
//                                 @Nullable FirebaseFirestoreException e) {
//                 if (e != null) {
//                     Log.w(TAG, "Listen error", e);
//                     return;
//                 }

//                 for (DocumentChange change : querySnapshot.getDocumentChanges()) {
//                     if (change.getType() == Type.ADDED) {
//                         Log.d(TAG, "New city:" + change.getDocument().getData());
//                     }

//                     String source = querySnapshot.getMetadata().isFromCache() ?
//                             "local cache" : "server";
//                     Log.d(TAG, "Data fetched from " + source);
//                 }

//             }
//         });