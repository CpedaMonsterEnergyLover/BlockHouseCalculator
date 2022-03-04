import 'dart:html';

import 'package:block_house_calculator/pages/objects/wall.dart';

class Floor {
  int index;
  List<Wall> walls =[]   ;
  int doorsCount = 0;


  String getName(){
    return "Этаж " + (index + 1).toString();
  }

  Floor(this.index);

  void addWall(){
    walls.add(Wall());
  }
}