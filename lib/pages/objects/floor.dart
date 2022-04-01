import 'dart:convert';

class Floor {
  int index;
  List<double> walls =[]   ; // выглядит как смайлик, смешно? я смеялся.
  int doorsCount = 0;
  int windowsCount = 0;


  String getName(){
    return "Этаж " + (index + 1).toString();
  }

  Floor(this.index);
  Floor.full(this.index, this.walls,this.doorsCount, this.windowsCount);




  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};


    json = {
      "index": index,
      "doorsCount": doorsCount,
      "windowsCount": windowsCount,
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