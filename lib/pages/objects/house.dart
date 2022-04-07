import 'dart:convert';

import 'floor.dart';

class House {
  String name = "Новый дом";
  List<Floor> floors = [];
  int houseWidth = 0;
  int houseLength = 0;
  int opletkaHeight = 0;
  int floorHeight = 0;
  int doorHeight = 0;
  int windowHeight = 0;
  House();
  House.full(String name, 
      List<Floor> floors, 
      int houseWidth,
      int houseLength,
      int opletkaHeight,
      int floorHeight,
      int doorHeight,
      int windowHeight);

  bool addFloor(){
    if(floors.length < 3){
      floors.add(Floor(floors.length));
      return true;
    }
    else {
      return false;
    }
  }

  void removeFloor(int index){
    floors.removeAt(index);
    for (var element in floors) {
      element.index = floors.indexOf(element);
    }
  }


//serialization
  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};

    Map<String, dynamic> floorsMap = {};
    for (var floor in floors) {
      floorsMap[floor.index.toString()] = floor.toJson();
    }

    json = {
      "name": name,
      "floors": floorsMap,
      "houseWidth": houseWidth,
      "houseLength": houseLength,
      "opletkaHeight": opletkaHeight,
      "floorHeight": floorHeight,
      "doorHeight": doorHeight,
      "windowHeight": windowHeight
    };
    return json;
  }
  //deserialization
  House fromJson(String json){
  Map<String, dynamic> map = jsonDecode(json);

  return House.full(map["name"], map["floors"], map["houseWidth"], map["houseLength"], map["opletkaHeight"], map["floorHeight"],map["doorHeight"],map["windowHeight"]);
  }
}