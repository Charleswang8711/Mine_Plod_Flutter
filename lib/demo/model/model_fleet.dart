
// model class, present these tables in dart

class Fleet {

  int id;
  String _fleedID;
  String _type;
  String _startDate;
  String _endDate;

  // we do not need to  touch database id in the model class. Since it will be created automatically when save the record.
  // we can get the id when we query something.
  Fleet(this._fleedID, this._type, this._startDate,this._endDate);

  static final columns = ["fleetID","type","startDate","endDate"];

 
  // Fleet.map(dynamic obj) {
  //   this._firstName = obj["firstname"];
  //   this._lastName = obj["lastname"];
  //   this._dob = obj["dob"];
  // }

// convert a map to a model Fleet instance. database will reture a map when executing a query(fetch)
// when excuting the query 
 Fleet.fromMap(Map<String, dynamic> map) {
    this._fleedID = map["fleetID"];
    this._type = map["type"];
    this._startDate = map["startDate"];
    this._endDate = map["endDate"];
  }

// to define a fromMap in other way
  // static fromMap(Map map) {
  //   Fleet user = new Fleet();
  //   user.id = map["id"];
  //   user.username = map["username"];

  //   return user;
  // }
  
// define some getter for refering the members

  String get fleetID => this._fleedID;
  String get type => this._type;
  String get startDate => this._startDate;
  String get endDate => this._endDate;

  // convert the dart class to map struct which is a format expected when inserting and updating a row in the database
  
  // 
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["fleetID"] = this._fleedID;
    map["type"] = this._type;
    map["startDate"] = this._startDate;
    map["endDate"] = this._endDate;

     if (this.id != null) {
      map["id"] = this.id;
    }
    return map;

  }

  // saving the info when we dont want to save the id to database???
  void setFleetId(int id) {
    this.id = id;
  }
}