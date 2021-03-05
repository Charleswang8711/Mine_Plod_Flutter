
import 'dart:async';


import 'package:mine_plod/demo/database/database.dart';
import 'package:mine_plod/demo/model/model_fleet.dart';




abstract class NewContract {
  void screenUpdate();
}

class DatabasePresenter {

   // abstract instance member
  NewContract _view;
  DatabasePresenter(this._view);



  var db = new DatabaseHelper();



  delete(Fleet fleet) {
    var db = new DatabaseHelper();
    db.deleteFleets(fleet);
    updateScreen();
  }

  Future<List<Fleet>> getFleet() {
    return db.getFleet();
  }

  updateScreen() {
    _view.screenUpdate();

  }
}