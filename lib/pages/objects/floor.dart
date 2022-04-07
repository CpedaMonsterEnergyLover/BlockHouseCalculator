import 'dart:convert';

class Floor {
  int index;
  List<int> walls =[]   ; // выглядит как смайлик, смешно? я смеялся.
  List<int> doors =[]   ;
  List<int> windows =[]   ;


  String getName(){
    return "Этаж " + (index + 1).toString();
  }

  Floor(this.index);
  Floor.full(this.index, this.walls,this.doors, this.windows);


  addWall(int value) {
    walls.add(value);
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};


    json = {
      "index": index,
      "doorsCount": doors,
      "windowsCount": windows,
      "walls": walls,
    };
    return json;
  }

  Floor fromJson(String json){
    Map<String, dynamic> map = jsonDecode(json);
    return Floor.full(
      map["index"], map["doorsCount"],map["windowsCount"],map["walls"],
    );
  }
}