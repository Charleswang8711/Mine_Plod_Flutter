import 'package:flutter/material.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'page wang First',
      home: const MyHomePage(title: 'page wang First'),// becomes the route named '/'
    );
  }
}

class MyHomePage extends StatelessWidget {

    const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
       final title = 'Grid List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:   new Card(
          color: Colors.white,
          margin: EdgeInsets.all(10.0),
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: const Icon(Icons.album),
                              title: const Text('The Enchanted Nightingale'),
                              subtitle: const Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                            ),
                            new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                              child: new ButtonBar(
                                children: <Widget>[
                                  new FlatButton(
                                    child: const Text('BUY TICKETS'),
                                    onPressed: () { /* ... */ },
                                  ),
                                  new FlatButton(
                                    child: const Text('LISTEN'),
                                    onPressed: () { /* ... */ },
                                  ),
                                   new FlatButton(
                                    child: const Text('LISTEN'),
                                    onPressed: () { /* ... */ },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
      ),
    );

    
  }
}

// return Card(
//       color: Colors.white,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Icon(choice.icon, size: 128.0, color: textStyle.color),
//             Text(choice.title, style: textStyle),
//           ],
//         ),
//       ),
//     );