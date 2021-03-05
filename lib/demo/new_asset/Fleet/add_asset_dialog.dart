import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mine_plod/demo/database/database.dart';

import 'package:mine_plod/demo/model/model_fleet.dart';


class AddFleetDialog {
  final teFleetID = TextEditingController();
  final teType = TextEditingController();
  final teStartDate = TextEditingController();
  final teEndDate = TextEditingController();
  Fleet fleet;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget buildAboutDialog(
      BuildContext context, _newAssetState, bool isEdit, Fleet fleet) {

        // for edite
    if (fleet != null) {
      this.fleet=fleet;
      teFleetID.text = fleet.fleetID;
      teType.text = fleet.type;
      teStartDate.text = fleet.startDate;
      teEndDate.text = fleet.endDate;
    }

    return new AlertDialog(
      title: new Text(isEdit ? 'Edit' : 'Add new Fleet'),
      content: new SingleChildScrollView(
        child: Container(
          width: 400.0,
           child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              getTextField("Enter Fleet ID", teFleetID),
              getTextField("Enter Type", teType),
              getTextField("Enter Start Date", teStartDate),
              getTextField("Enter End Date", teEndDate),
              new GestureDetector(
                onTap: () {
                  addRecord(isEdit);
                  _newAssetState.displayRecord();
                   Navigator.of(context).pop();
                },
                child: new Container(

                  margin: EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 0.0),
                  child: getAppBorderButton(
                      isEdit?"Edit":"Add", EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: new Text(
        buttonLabel,
        style: new TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  Future addRecord(bool isEdit) async {
    var db = new DatabaseHelper();
    var fleet = new Fleet(teFleetID.text, teType.text, teStartDate.text,teEndDate.text);
    if (isEdit) {
      // just for update or delete the use. we don`t save the id to database
      fleet.setFleetId(this.fleet.id);
      await db.update(fleet);
    } else {
      await db.saveFleet(fleet);
    }
  }
}