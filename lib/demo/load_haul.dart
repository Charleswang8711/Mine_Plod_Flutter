import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mine_plod/demo/model/model_fleet.dart';
import 'package:mine_plod/demo/selectlist.dart';

class LoadAndHaul extends StatefulWidget{

  List<Fleet> grid;

   LoadAndHaul( List<Fleet> this.grid, {Key key,}) : super(key: key);

  LoadAndHaulState createState()=>  LoadAndHaulState();
}


class LoadAndHaulState extends State<LoadAndHaul> {



String _seletedOper = '';

 List<String> _dropRL = ["Jhon Mc","Wang","Lee"];


String _seletedRL;

String _seletedAct = '';

String _seletedMaterial = '';

String _seletedDigger = '';

List<Fleet> _exlist = [];

void _selecteditemRL( String item ) => this._seletedRL = item;

 @override

  void initState() {
    super.initState();
    _getDiffList();
    
  }

  void _getDiffList() {

    for(int i =0; i < widget.grid.length; i++ )
    {
      if(widget.grid[i].type == "ex")
      {
        _exlist.add(widget.grid[i]);
      }
      else
      {
         ///
      }
    }

  }

Future _askedToLoad() async {
   showDialog(
    context: context,
    builder: (BuildContext context) {
      return new SimpleDialog(
        title: const Text('Select Activity'),
        children: <Widget>[
          new SimpleDialogOption(
            onPressed: () { Navigator.pop(context); 
            
            _seletedAct = 'Loading and Hauling';
            setState(() {});
            },
            child: const Text('Loading and Hauling'),
          ),
          new SimpleDialogOption(
            onPressed: () { Navigator.pop(context);
             _seletedAct = 'Day work';
            setState(() {});
             },
            child: const Text('Day work'),
          ),
           new SimpleDialogOption(
            onPressed: () { Navigator.pop(context);
             _seletedAct = 'Downtime';
            setState(() {});},
            child: const Text('Downtime'),
          ),
           new SimpleDialogOption(
            onPressed: () { Navigator.pop(context);
             _seletedAct = 'Standby';
            setState(() {});}, 
            child: const Text('Standby'),
          ),
        ],
      );
    }
   );
   setState(() {});
}

Future _askedToMaterial() async {

   showDialog(
    context: context,
    builder: (BuildContext context) {
      return new SimpleDialog(
        title: const Text('Select Material'),
        children: <Widget>[
          new SimpleDialogOption(
            onPressed: () { Navigator.pop(context); 
            _seletedMaterial = 'Waste';
            setState(() {});
            },
            child: const Text('Waste'),
          ),
          new SimpleDialogOption(
            onPressed: () { Navigator.pop(context);
             _seletedMaterial = 'SFT1';
            setState(() {});
             },
            child: const Text('SFT1'),
          ),
        ],
      );
    }
   );

  // List<String> values = ["1", "2", "3"];

  // var dialog = new AlertDialog(
  //               title: new Text("test"),
  //               content: new ListView.builder(
  //                   itemBuilder: (BuildContext buildContext, int index){
  //                     return new Text(values[index]);
  //                   },),
                        
  //             );

  // showDialog(context: context, builder: (BuildContext context) => dialog);

   setState(() {});
}

Future _askedToDigger() async {

   String digger0 = this._exlist[0].fleetID;
   String digger1 = this._exlist[1].fleetID;
    String digger2 = this._exlist[2].fleetID;

   showDialog(
    context: context,
    builder: (BuildContext context) {
      return new SimpleDialog(
        title: const Text('Select Digger'),
        children: <Widget>[
          new SimpleDialogOption(
            onPressed: () { Navigator.pop(context); 
            _seletedDigger = '$digger0';
            setState(() {});
            },
            child: new  Text('$digger0'),
          ),
          new SimpleDialogOption(
            onPressed: () { Navigator.pop(context);
             _seletedDigger = '$digger1';
            setState(() {});
             },
            child: new Text('$digger1'),
          ),

          new SimpleDialogOption(
            onPressed: () { Navigator.pop(context);
             _seletedDigger = '$digger2';
            setState(() {});
             },
            child: new Text('$digger2'),
          ),
        ],
      );
    }
   );

  // List<String> values = ["1", "2", "3"];

  // var dialog = new AlertDialog(
  //               title: new Text("test"),
  //               content: new ListView.builder(
  //                   itemBuilder: (BuildContext buildContext, int index){
  //                     return new Text(values[index]);
  //                   },),
                        
  //             );

  // showDialog(context: context, builder: (BuildContext context) => dialog);

   setState(() {});
}


  
  @override
  Widget build(BuildContext context){

    Widget firstLine = new Expanded(
      flex: 1,
      child: new Container(
        child: new Row( children: <Widget>[

          new Container(
            margin: EdgeInsets.only(left: 20.0),
            width: 200.0,
            height: 70.0,
            child: new RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: new Column( children: <Widget>[
                  new Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: new Text('Activity',style: new TextStyle(
                      fontSize: 20.0,
                    )),
                    )),
                  new Expanded(
                    flex: 2,
                    child: new Text("$_seletedAct", style: new TextStyle(
                      color:Colors.red,
                    ),)),

                ],
                ),
                
                onPressed: _askedToLoad,

          )),

          
          new Container(
            margin: EdgeInsets.only(left: 20.0),
            width: 200.0,
            height: 70.0,
            child: new RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: new Column( children: <Widget>[
                  new Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: new Text('Material',style: new TextStyle(
                      fontSize: 20.0,
                    )),
                    )),
                  new Expanded(
                    flex: 2,
                    child: new Text("$_seletedMaterial", style: new TextStyle(
                      color:Colors.red,
                    ),)),

                ],
                ),
                
                onPressed: _askedToMaterial,

          )),


        ],)
        )
      );

      Widget secondLine = new Expanded(
      flex: 1,
      child: new Container(
        child: new Row( children: <Widget>[

          new Container(
            margin: EdgeInsets.only(left: 20.0),
            width: 200.0,
            height: 70.0,
            child: new RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: new Column( children: <Widget>[
                  new Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: new Text('Digger',style: new TextStyle(
                      fontSize: 20.0,
                    )),
                    )),
                  new Expanded(
                    flex: 2,
                    child: new Text("$_seletedDigger", style: new TextStyle(
                      color:Colors.red,
                    ),)),

                ],
                ),
                
                onPressed: _askedToDigger,

          )),
          new Container(
            margin: EdgeInsets.only(left: 20.0),
            width: 200.0,
            height: 70.0,
            child: new RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: new Column( children: <Widget>[
                  new Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: new Text('Location',style: new TextStyle(
                      fontSize: 20.0,
                    )),
                    )),
                  new Expanded(
                    flex: 2,
                    child: new Text("$_seletedAct", style: new TextStyle(
                      color:Colors.red,
                    ),)),

                ],
                ),
                
                onPressed: _askedToMaterial,

          )),


        ],)
        )
      );
  

    Widget topAsset = new Expanded
    (
          flex: 1,
          child: new Card(
            child: new Container(
              child: new Column(

                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                 children: <Widget>[
                firstLine,
                secondLine,
              ],),

      ),
          ),
    );

    Widget rl = new Container(
       margin: EdgeInsets.only(left: 100.0),
      child: new Row( children: <Widget>[
        new Text("RL  :"),

        new SelectList(drop: _dropRL, selecteditemFun: _selecteditemRL,name:" ")

      ],)
    );

    
    Widget route = new Container(
       margin: EdgeInsets.only(left: 100.0),
       child: new Row( children: <Widget>[
        new Text("Route   :"),

        new SelectList(drop: _dropRL, selecteditemFun: _selecteditemRL,name:" ")

      ],)
    );

    
    Widget destination = new Container(
       margin: EdgeInsets.only(left: 100.0),
      child: new Row( children: <Widget>[
        new Text("Destination  :"),

        new SelectList(drop: _dropRL, selecteditemFun: _selecteditemRL,name:" ")

      ],)
    );

    
    Widget blockid = new Container(
      margin: EdgeInsets.only(left: 100.0),
      child: new Row( children: <Widget>[
        new Text("Block Id  :"),
        new SelectList(drop: _dropRL, selecteditemFun: _selecteditemRL,name:" ")

      ],)
    );
    


    Widget bottomAsset = new Expanded(
        flex: 1,
        child: new Card(
            child: Container(
              child: new Column( 
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                rl,
                route,
                destination,
                blockid,    
              ],
              
              )
            
            
            )
        )
    );

    Widget assetSelArea = new Expanded(
      flex: 1,
      child: new Container(
        child: new Column( children: <Widget>[
          topAsset,
          bottomAsset,
        ],)
      ),

    );

    Widget operationCurr = new Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: new Text(
        "$_seletedOper",
        style: new TextStyle(
           color: Colors.red,
          fontWeight: FontWeight.w600,
          fontSize: 50.0,
        ),

      ),
      
    );

    Widget timer = new Card(
          child: new Container(
           margin: EdgeInsets.all(50.0),
          child: new Text(
          "Timer",
          style: new TextStyle(
             color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 50.0,
          ),

        ),

      ),
    );

    Widget timerGoArea = new Expanded(
      flex: 1,
      child: new Container(
        margin: EdgeInsets.all(20.0),
        child:new Column( children: <Widget>[
          operationCurr,
          timer,
        ],)
      ),

    );

    Widget topArea = new Expanded(
      flex: 7,
      child: new Container(
              child: new Row(
                 children: <Widget>[

                   assetSelArea,
                   timerGoArea,

          ],
        ),
      ),

    );

    Widget bottomLoad = new Expanded(
      flex: 1,
      child: new Container(
    margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child:Text('Loading Start'),
          onPressed: (){
            _seletedOper = "Loading";
            setState(() {
                          
                        });
          }),

        )
      );

       Widget bottomHaul = new Expanded(
      flex: 1,
      child: new Container(
        
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child:Text('Hauling Start'),
          onPressed: (){
            _seletedOper = "Hauling";
            setState(() {
                          
                        });
          }),

        )
      );

       Widget bottomEmpty = new Expanded(
         flex: 1,
          child: new Container(
         margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child:Text('Empty'),
          onPressed: (){
            _seletedOper = "Empty";
             setState(() {
                          
                        });

            
            
          }),

        )
      );

       Widget bottomQueued = new Expanded(
      flex: 1,
      child: new Container(
         margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child:Text('Queued'),
          onPressed: (){
            _seletedOper = "Queued";

             setState(() {
                          
                        });
          }),

        )
      );
  

    Widget bottomArea = new Expanded(
      flex:1,
      child: new Container(
              child: new Row(
                  children: <Widget>[
                  bottomLoad,
                  bottomHaul,
                  bottomEmpty,
                  bottomQueued,   
          ],
          ),
      )
    );

     Widget body = new Container(
       child: new Column(
         children: <Widget>[
           topArea,
           bottomArea,
         ], 
       ),
    );
    Widget _buildTitle(BuildContext context) {

    return new InkWell(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text('Mine Plot',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
   };

    return  new Scaffold(
      appBar: new AppBar(
        title: _buildTitle(context),
        ),
       body: body,
    );
  }
}