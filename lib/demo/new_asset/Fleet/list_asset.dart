import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mine_plod/demo/database/database_presenter.dart';
import 'package:mine_plod/demo/model/model_fleet.dart';
import 'package:mine_plod/demo/new_asset/Fleet/add_asset_dialog.dart';

class FleetList extends StatelessWidget {
  // fro present the content of the list
  List<Fleet> country;
  DatabasePresenter databasePresenter;

  FleetList(
    List<Fleet> this.country,
    DatabasePresenter this.databasePresenter, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: country == null ? 0 : country.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 30.0,
                        child: new Text(getType(country[index])),
                        backgroundColor: const Color(0xFF20283e),
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                country[index].fleetID,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.lightBlueAccent),
                              ),
                              new Text(
                                 "Start Date:" + country[index].startDate,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         new IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: const Color(0xFF167F67),
                              ),
                              onPressed: () => edit(country[index], context),
                            ),

                          new IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: const Color(0xFF167F67)),
                            onPressed: () =>
                                databasePresenter.delete(country[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );
        });
  }

  displayRecord() {
    databasePresenter.updateScreen();
  }
  edit(Fleet fleet, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddFleetDialog().buildAboutDialog(context, this, true, fleet),
    );
    databasePresenter.updateScreen();
  }

  String getType(Fleet fleet) {
    String shortName = "";
    shortName = fleet.type;
    return shortName;
  }
}