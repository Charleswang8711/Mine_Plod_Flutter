import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mine_plod/demo/selectlist.dart';



class Login extends StatefulWidget{
  LoginState createState()=>  LoginState();

}

class LoginState extends State<Login> {

  final TextEditingController _textController = new TextEditingController(); //new

  final DocumentReference _docrefTruck = Firestore.instance.collection('fleet').document('Truck');
  final DocumentReference _docrefEx = Firestore.instance.collection('fleet').document('Excavator');
  final CollectionReference _assetref = Firestore.instance.collection('fleet');

  // the data is for filling the contentof select
  List<String> _drop = ["item 1","item 2","item 3","item 4","item 5"];

  List<dynamic> _grid = [];

  String _seleteditem;
  String _griditem;
  String _password;
  String _seletedasset = '';
  // default color
  Color _myColor_1 = Colors.grey;
  Color _myColor_2 = Colors.grey;
  Color _myColor_3 = Colors.grey;

  void _selecteditemFun( String item ) => _seleteditem = item;

  void _handleSubmitted(String text) => _password = text;

  
  void _fetchTruck() {
    _docrefTruck.snapshots().listen( (docsnapshot) {
      if(docsnapshot.exists)
      {
        setState(() {

            // get the data from the database
            _grid = docsnapshot["ID"];
           if (_myColor_2 == Colors.grey) {
             _myColor_2 = Colors.teal[100];
             _myColor_3 = Colors.grey;
             _myColor_1 = Colors.grey;
             }
             else {                           
             _myColor_2 = Colors.grey;
                                           
            }
                  
          });
      }
      });
    }

    void _fetchEx() {
      _docrefEx.snapshots().listen( (docsnapshot) {
      if(docsnapshot.exists)
      {
        setState(() {

            _grid = docsnapshot["ID"];
           if (_myColor_1 == Colors.grey) {
             _myColor_1 = Colors.teal[100];
             _myColor_2 = Colors.grey;
             _myColor_3 = Colors.grey;
             }
             else {                           
             _myColor_1 = Colors.grey;
                                           
            }
                  
          });
      }

     
       
      
    });

     
    }


  final myTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    title: 'Shopping App',
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("MinepPlod"),
        ),
       body: new Row(
        children: <Widget>[
          new Expanded(
           child: new Card(
                  margin :const EdgeInsets.all(30.0),
                 
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        child: GridView.builder(
                              itemCount: _grid.length,
                              gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 4),
                              itemBuilder: (BuildContext context, int index) {
                                  _griditem = _grid[index].toString();
                                  return GestureDetector(
                                    child: Card(
                                      color:Colors.teal[50],
                                      elevation: 2.0,
                                      child: new Container(
                                           
                                            alignment: Alignment.center,
                                            child: new Text('$_griditem',
                                            style: new TextStyle(color: Colors.red ,fontWeight: FontWeight.bold, fontSize:20.0)),
                                          ),

                                    ),
                      
                                  onTap:()
                                  {
                                    setState(() {
                                                                          
                                         _seletedasset = _grid[index];                               });
                                  }
                                );
                              })
                            ), 

                                 
                      new Container(
                        padding: EdgeInsets.only(left:10.0,right: 10.0),
                        child: new Divider(
                        color:Colors.grey,
                        ),
                      ),



                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.only(left:10.0,right: 20.0),
                             child: new RaisedButton(
                                    color: _myColor_1,
                                    textColor: Colors.white,
                                    child:Text('Excavator'),
                                    onPressed: _fetchEx,
                                  ),
                           ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new RaisedButton(
                                    color:_myColor_2,
                                    textColor: Colors.white,
                                    child: const Text('Truck'),
                                    onPressed: _fetchTruck,
                                  ),
                            ),
                           Padding(
                             padding: const EdgeInsets.only(left:20.0,right: 20.0),
                             child: new RaisedButton(
                                    // color: Colors.red,
                                    textColor: Colors.white,
                                    color: _myColor_3,
                                    child: const Text('Ancillary'),
                                   
                                    onPressed: () { 
                                      setState(() {

                                            // the data is for fill the content of grid
                                        _grid = ["item 1"];

                                         if (_myColor_3 == Colors.grey) {
                                            _myColor_3 = Colors.teal[100];
                                            _myColor_1 = Colors.grey;
                                            _myColor_2 = Colors.grey;
                                          }
                                          else {
                                            _myColor_3 = Colors.grey;
                                            
                                          }
                                              
                                            });
                                     },
                                  ),
                           ),
                        ],   
                      ),
                     
                               
                      ],
                           
                     
                        
                     
              
                  ),
                ),
          ),
          
          new Expanded(
            child:new Container(
                margin: const EdgeInsets.only(left:30.0,right: 30.0),
                // padding: const EdgeInsets.all(20.0),
                child: new Card(
                  child: new Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(top:10.0),
                          child: new Text(
                            "$_seletedasset",
                           // textAlign: TextAlign.center,
                            style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.0)
                            ),
                        ),
                     
                        Padding(
                          padding: const EdgeInsets.only(left:10.0,right: 10.0),
                          child: new Divider(
                            color:Colors.grey,
                              ),
                        ),
                        new Container(
                            padding: const EdgeInsets.all(0.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisSize: MainAxisSize.min,
                              children: <Widget>[

                                    // new Row(
                                    //   children: <Widget>[
                                    //     new Text("Operator  :"),

                                    //     Padding(
                                    //       padding: const EdgeInsets.only(left: 100.0),
                                    //       child: new SelectList(drop: _drop, selecteditemFun: _selecteditemFun),
                                    //     ),
                                    //   ],

                                    // ),

                                    Padding(
                                      padding: const EdgeInsets.only(top:0.0),
                                      
                                      child: SelectList(drop: _drop, selecteditemFun: _selecteditemFun),
                                    ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.only(top:0.0),
                                    child: new TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Pass Word',
                                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                              ),
                                              obscureText: true,
                                              controller: myTextController,
                                            ),
                                  ),

                              new Container(
                                      margin: new EdgeInsets.symmetric(horizontal: 4.0,vertical: 5.0),
                                      child: new RaisedButton(
                                        color: Colors.green,
                                        child: new Text("Login"),
                                        onPressed: () => _handleSubmitted(myTextController.text)),
                                    ),
                               
                              ]
                            )),
                                
                         
                        ]
                        
                        ),
                        ),
                )
                      

               

                   
                  

              
               

                  ) 
                
        ],

      ),
    )
  );
  }
}





  
  






 


  