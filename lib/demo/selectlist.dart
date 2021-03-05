import 'package:flutter/material.dart';

// void main () => runApp(new MyApp());


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "this is a demo",
//       theme: ThemeData(
//         primarySwatch: Colors.blue
//       ),
//       home : MyHomePage(title:"Drop Down"),
//     );
//   }
// }

// the home page is a dropdown button
class SelectList extends StatefulWidget{

  SelectList({Key key, this.drop, this.selecteditemFun, this.name}) : super(key : key);

  final List<String> drop;
  final Function selecteditemFun;
  final String name;


  @override
  SelectListState createState()=>  SelectListState();

}


class SelectListState extends State<SelectList> {

 
  String listname;

  List < DropdownMenuItem<String>> listdrop = [];

  // how to convert data from database to widget


  // show the selected item, it will be changed time by time
  String _selected;

  void _loadData(){
    // it is be cleared while it is loadded

    listname = widget.name; 

    listdrop = [];
    listdrop = widget.drop.map((val) => DropdownMenuItem(
      // properties are seperated by commo
      child : Text(
      val,
      style: new TextStyle(color: Colors.black),
      
      ),
      value:val
      )).toList();
  }
  @override
  Widget build(BuildContext context){
    // it will be loaded data when it render at first time
    _loadData();
    return Container(
        child :DropdownButton( 
          value: _selected,
          items: listdrop, 
          // show placeholder
          iconSize: 40.0,
          elevation: 1,
          hint: new Text("$listname"),
          onChanged: (value) {
            setState(() {
             _selected = value;
             widget.selecteditemFun(_selected);
          });}
       )
      );
    
  }
}