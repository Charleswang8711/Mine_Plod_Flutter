import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mine_plod/demo/database/database_presenter.dart';
import 'package:mine_plod/demo/model/model_fleet.dart';
import 'package:mine_plod/demo/new_asset/Fleet/add_asset_dialog.dart';
import 'package:mine_plod/demo/new_asset/Fleet/list_asset.dart';



class NewAsset extends StatefulWidget {
  NewAsset({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NewAssetState createState() => new _NewAssetState();
}

class _NewAssetState extends State<NewAsset> implements NewContract {
  DatabasePresenter databasePresenter;

  @override
  void initState() {
    super.initState();
    databasePresenter = new DatabasePresenter(this);
  }

  displayRecord() {
    setState(() {});
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
        Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.center;

    return new InkWell(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            new Text('New Fleet',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _openAddFleetDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddFleetDialog().buildAboutDialog(context, this, false, null),
    );

    setState(() {});
  }

  List<Widget> _buildActions() {
    return <Widget>[
      new IconButton(
        icon: const Icon(
          IconData(0xe145, fontFamily: 'MaterialIcons'),
          color: Colors.white,
        ),
        onPressed: _openAddFleetDialog,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

 
    return new Scaffold(
      appBar: new AppBar(
        title: _buildTitle(context),
        actions: _buildActions(),
      ),
      body: new FutureBuilder<List<Fleet>>(
        // for get the data from the database
        future: databasePresenter.getFleet(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          var data = snapshot.data;
          return snapshot.hasData

          // display all the records by userlist
              ? new FleetList(data,databasePresenter)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void screenUpdate() {
    setState(() {});
  }
}