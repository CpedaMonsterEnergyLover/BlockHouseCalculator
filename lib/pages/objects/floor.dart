import 'dart:convert';

import 'package:block_house_calculator/pages/objects/wall.dart';

class Floor {
  int index;
  List<Wall> walls =[]   ; // выглядит как смайлик, смешно? я смеялся.
  int doorsCount = 0;
  int windowsCount = 0;

  String getName(){
    return "Этаж " + (index + 1).toString();
  }

  Floor(this.index, this.walls, this.doorsCount, this.windowsCount);


  void addWall(){
    walls.add(Wall());
  }



  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};

    Map<String, dynamic> wallsMap = {};
    for (var wall in walls) {
      wallsMap[wall.toString()] = wall.toJson();
    }

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
    return Floor(
      map["index"], map["doorsCount"],map["windowsCount"],map["walls"],
    );
  }
}