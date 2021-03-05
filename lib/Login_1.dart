import 'package:flutter/material.dart';
import 'package:mine_plod/demo/selectlist.dart';


class Login extends StatefulWidget{
  LoginState createState()=>  LoginState();

}

class LoginState extends State<Login> {

  final TextEditingController _textController = new TextEditingController(); //new

  // the data is for filling the contentof select
  List<String> _drop = ["item 1","item 2","item 3","item 4","item 5"];


  List<String> _grid = ["item1","item2","item3"];

  String _seleteditem;
  String _griditem;
  String _password;
  String _seletedasset = '';

  void _selecteditemFun( String item ) => _seleteditem = item;

  void _handleSubmitted(String text) => _password = text;

  final myTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myTextController.dispose();
    super.dispose();
  }

  // VoidCallback _setupAsset(){

  //   setState(() {

  //        // the data is for fill the content of grid
  //   _grid = ["item 1","item 2","item 3","item 4","item5",
  //  "item5","item5","item5","item5","item5","item5","item5","item5","item5","item5","item5","item5"
  //  ,"item5","item5","item5","item80"];
          
  //       });


  // }

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
                                  _griditem = _grid[index];
                                  return GestureDetector(
                                    child: Card(
                                      color:Colors.teal[100],
                                      elevation: 2.0,
                                      child: new Container(
                                           
                                            alignment: Alignment.center,
                                            child: new Text('Item $_griditem'),
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

                                  //  return Container(
                                  // alignment: Alignment.center,
                                  //  color: Colors.teal[100],
                                  //  child: new Text("ListItem $_griditem"),
                                  //  child: FlatButton(
                                  //                    child: Text('grid item $_griditem'),
                                  //                    onPressed: () { setState(() {
                                                                                                            
                                  //                     _seletedasset = _griditem; }); },
                                  //                    ),
                                  //           );
                                  //  }),
                        // child: new CustomScrollView(
                        //           primary: false,
                        //           slivers: <Widget>[

                        //             SliverGrid(
                        //                 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        //                   maxCrossAxisExtent: 200.0,
                        //                   mainAxisSpacing: 10.0,
                        //                   crossAxisSpacing: 10.0,
                        //                   childAspectRatio: 4.0,
                        //                 ),
                        //                 delegate: SliverChildBuilderDelegate(
                        //                       (BuildContext context, int index) {
                        //                         // get the data 
                        //                         _griditem = _grid[index];
                        //                         return Container(
                        //                           alignment: Alignment.center,
                        //                            color: Colors.teal[100],
                        //                            child: FlatButton(
                        //                              child: Text('grid item $_griditem'),
                        //                              onPressed: () { setState(() {
                                                                                                            
                        //                               _seletedasset = _griditem; }); },
                        //                              ),
                        //                     );
                        //                   },
                        //                   childCount: _grid.length,
                        //                 ),
                        //               ),
                        //           ],
                        //         ),
                     

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
                             padding: const EdgeInsets.all(8.0),
                             child: new RaisedButton(
                                    color: Colors.red,
                                    child:Text('Excavator'),
                                    onPressed: () {
                                      setState(() {

                                            // the data is for fill the content of grid
                                        _grid = ["item 1","item 2","item 3","item 4","item5"];
                                              
                                            });

                                     },
                                  ),
                           ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new RaisedButton(
                                    color: Colors.red,
                                    child: const Text('Truck'),
                                    onPressed: () {
                                      setState(() {
                                                 // the data is for fill the content of grid
                                              _grid = ["item 1","item 2","item 3","item 4","item5",
                                            "item5","item5","item5","item5","item5","item5","item5","item5","item5","item5","item5","item5"
                                            ,"item5","item5","item5","item80"];
                                                    
                                                  });     
                                    }
                                  ),
                            ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: new RaisedButton(
                                    color: Colors.red,
                                    child: const Text('Ancillary'),
                                    onPressed: () { 
                                      setState(() {

                                            // the data is for fill the content of grid
                                        _grid = ["item 1"];
                                              
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





  
  






 


  