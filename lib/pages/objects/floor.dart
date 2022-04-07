import 'dart:convert';

import 'package:block_house_calculator/pages/objects/wall.dart';

class Floor {
  int index;
  List<Wall> walls =[]   ; // выглядит как смайлик, смешно? я смеялся.
  List<int> doors =[]   ;
  List<int> windows =[]   ;


  String getName(){
    return "Этаж " + (index + 1).toString();
  }

  Floor(this.index);
  Floor.full(this.index, this.walls,this.doors, this.windows);

  String calculate(){

    return "XYU";
  }

  addWall(int value) {
    walls.add(Wall(value));
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};

  //TODO:переписать под объекты стен
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