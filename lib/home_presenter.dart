
import 'dart:async';

import 'package:mine_plod/database/database.dart';
import 'package:mine_plod/model/user.dart';



abstract class HomeContract {
  void screenUpdate();
}

class HomePresenter {
  HomeContract _view;
  var db = new DatabaseHelper();

  HomePresenter(this._view);
  delete(User user) {
    var db = new DatabaseHelper();
    db.deleteUsers(user);
    updateScreen();
  }

  Future<List<User>> getUser() {
    return db.getUser();
  }

  updateScreen() {
    _view.screenUpdate();

  }
}