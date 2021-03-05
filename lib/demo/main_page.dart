import 'package:flutter/material.dart';
import 'package:mine_plod/demo/Login.dart';
import 'package:mine_plod/demo/data_collection.dart';
import 'package:mine_plod/demo/database/database.dart';
import 'package:mine_plod/demo/layout_page.dart';
import 'package:mine_plod/demo/load_haul.dart';
import 'package:mine_plod/demo/model/model_fleet.dart';
import 'package:mine_plod/demo/new_asset/Fleet/newscreen.dart';


class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // for get the data from database

  var db = new DatabaseHelper();

  LayoutPage _layoutSelection = LayoutPage.newasset;


  void _onLayoutSelected(LayoutPage selection) {
    setState(() {
         _layoutSelection = selection;
    });
  }

  void _onSelectTab(int index) {
   switch (index) {
        case 0:
          _onLayoutSelected(LayoutPage.newasset);
          break;
        case 1:
          _onLayoutSelected(LayoutPage.login);
          break;
        case 2:
          _onLayoutSelected(LayoutPage.load_haul);
          break;
        case 3:
          _onLayoutSelected(LayoutPage.datacollection);
          break;
      }
  }

  Color _colorTabMatching({LayoutPage layoutSelection}) {
    return _layoutSelection == layoutSelection ? Colors.orange : Colors.grey;
  }

  BottomNavigationBarItem _buildItem(
      {IconData icon, LayoutPage layoutSelection}) {
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(layoutSelection: layoutSelection),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
      ),
    );
  }

  Widget _buildBody() {
    LayoutPage layoutSelection = _layoutSelection;
    switch (layoutSelection) {
      case LayoutPage.newasset:
        return NewAsset();
      case LayoutPage.login:
        return _assetmove("login");
      case LayoutPage.load_haul:
        return _assetmove("load");
      case LayoutPage.datacollection:
        return DataCollection();
    }
    return null;
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(
              icon: Icons.line_weight, layoutSelection: LayoutPage.newasset),
          _buildItem(
              icon: Icons.line_weight, layoutSelection: LayoutPage.login),
          _buildItem(
              icon: Icons.line_weight, layoutSelection: LayoutPage.load_haul),
          _buildItem(
              icon: Icons.line_weight, layoutSelection: LayoutPage.datacollection),
        ],
        onTap: _onSelectTab,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

Widget _assetmove( String page)
{
  
  // get data from database
  return FutureBuilder<List<Fleet>>(
        // for get the data from the database
        future: db.getFleet(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          var data = snapshot.data;
          if(page == "login")
          {

          return snapshot.hasData
          // display all the records by userlist
              ? new Login(data)
              : new Center(child: new CircularProgressIndicator());

          }
          else
          {

             return snapshot.hasData
          // display all the records by userlist
              ? new LoadAndHaul(data)
              : new Center(child: new CircularProgressIndicator());

          }
        },
      );

}




}

