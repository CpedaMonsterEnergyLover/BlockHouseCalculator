import 'dart:convert';

import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:block_house_calculator/pages/objects/wall.dart';

class Floor {
  int index;
  List<Wall> walls =[]   ; // выглядит как смайлик, смешно? я смеялся.
  List<Wall> doors =[]   ;
  List<Wall> windows =[]   ;
  HouseSettings settings;


  String getName(){
    return "Этаж " + (index + 1).toString();
  }

  Floor(this.index, this.settings);
  Floor.full(this.index, this.walls,this.doors, this.windows, this.settings);

  String calculate(){

    return "XYU";
  }

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
      map["index"], map["doorsCount"],map["windowsCount"],map["walls"],map["settings"]
    );
  }
}