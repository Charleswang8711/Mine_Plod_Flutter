
import 'package:flutter/material.dart';
import 'package:mine_plod/demo/model/model_fleet.dart';
import 'package:mine_plod/demo/selectlist.dart';



class Login extends StatefulWidget{

  List<Fleet> grid;

   Login( List<Fleet> this.grid, {Key key,}) : super(key: key);

  LoginState createState()=>  LoginState();

}

class LoginState extends State<Login> {

  @override

  void initState() {
    super.initState();
    _getDiffList();
    
  }

  final TextEditingController _textController = new TextEditingController(); //new

  // the data is for filling the contentof select
  List<String> _drop = ["Jhon Mc","Wang","Lee"];

  List<Fleet> _assetlist = [];

  List<Fleet> _trucklist = [];
  List<Fleet> _exlist = [];

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

  void _getDiffList() {

    for(int i =0; i < widget.grid.length; i++ )
    {
      if(widget.grid[i].type == "ex")
      {
        _exlist.add(widget.grid[i]);
      }
      else
      {
        _trucklist.add(widget.grid[i]);
      }
    }
    // display truck info by default
    _fetchTruck();
    

  }
  
  void _fetchTruck() {
      _assetlist = _trucklist;
           
           if (_myColor_2 == Colors.grey) {
             _myColor_2 = Colors.teal[100];
             _myColor_3 = Colors.grey;
             _myColor_1 = Colors.grey;
             }
             else {                           
             _myColor_2 = Colors.grey;
                                           
            }           
     setState(() { });
    }

    void _fetchEx() {

    _assetlist = _exlist;

     
           if (_myColor_1 == Colors.grey) {
             _myColor_1 = Colors.teal[100];
             _myColor_2 = Colors.grey;
             _myColor_3 = Colors.grey;
             }
             else {                           
             _myColor_1 = Colors.grey;
                                           
            }
                  
        setState(() {  });

    

     
    }


  final myTextController = TextEditingController();

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
  }

   Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        obscureText: true,
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: _buildTitle(context),
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
                              itemCount: _assetlist.length,
                              gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 4),
                              itemBuilder: (BuildContext context, int index) {
                                  _griditem = _assetlist[index].fleetID;
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
                                                                          
                                         _seletedasset = _assetlist[index].fleetID;                               });
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
                                        _assetlist = [];

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
                  child: Container(
                      child: new Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            new Container(
                              padding: const EdgeInsets.only(top:10.0),
                              child: new Text(
                              "$_seletedasset",
                             // textAlign: TextAlign.center,
                              style: new TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 50.0,
                                ),
                              ),
                            ),
                  
                           new Container(
                             padding: const EdgeInsets.only(left:10.0,right: 10.0),
                               child: new Divider(
                                color:Colors.grey,
                              ),),
                     
                          new Container(
                            padding: const EdgeInsets.all(0.0),
                            child: new Column(
                              
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisSize: MainAxisSize.min,
                              children: <Widget>[

                                    new Container(
                                                                       
                                        padding: const EdgeInsets.only(top:0.0),
                                        child: SelectList(drop: _drop, selecteditemFun: _selecteditemFun,name: "Operator Name",),
                                     
                                    ),
                                  
                                  new Container(                              
                                      padding: const EdgeInsets.only(left: 20.0,right:20.0),
                                      child: getTextField("Pass Word", _textController),
                                              
                                  ),

                              new Container(
                                      margin: new EdgeInsets.symmetric(horizontal: 4.0,vertical: 5.0),
                                      child: new RaisedButton(
                                        color: Colors.green,
                                        child: new Text("Login"),
                                        onPressed: () => _handleSubmitted(_textController.text)),
                                    ),
                               
                              ]
                            )),
                                
                         
                        ]
                        
                        ),
                        ),
                )
                      

               

                   
                  

              
               

                  ) 
          ),
                
        ],

      ),
    );
  
  }
}





  
  






 


  