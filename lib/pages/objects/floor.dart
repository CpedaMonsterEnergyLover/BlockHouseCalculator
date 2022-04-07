import 'dart:convert';

import 'package:block_house_calculator/pages/objects/wall.dart';

class Floor {
  int index;
  List<Wall> walls =[]   ; // выглядит как смайлик, смешно? я смеялся.
  List<Wall> doors =[]   ;
  List<Wall> windows =[]   ;


  String getName(){
    return "Этаж " + (index + 1).toString();
  }

  Floor(this.index);
  Floor.full(this.index, this.walls,this.doors, this.windows);


  addWall(int value) {
    walls.add(Wall(value));
  }  addDoor(int value) {
    doors.add(Wall(value));
  }addWindow(int value) {
    windows.add(Wall(value));
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