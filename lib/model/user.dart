
// model class, present these tables in dart

class User {

  int id;
  String _firstName;
  String _lastName;
  String _dob;

  User(this._firstName, this._lastName, this._dob);

  static final columns = ["_firstName","_lastName","_dob"];

 
  // User.map(dynamic obj) {
  //   this._firstName = obj["firstname"];
  //   this._lastName = obj["lastname"];
  //   this._dob = obj["dob"];
  // }

// convert a map to a model user instance
 User.fromMap(Map<String, dynamic> map) {
    this._firstName = map["firstname"];
    this._lastName = map["lastname"];
    this._dob = map["dob"];
  }
  

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get dob => _dob;

  // convert the model class to map struct which is a format expected when inserting and updating a row in the database
  
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["firstname"] = this._firstName;
    map["lastname"] = this._lastName;
    map["dob"] = this._dob;
    return map;
  }

  void setUserId(int id) {
    this.id = id;
  }
}