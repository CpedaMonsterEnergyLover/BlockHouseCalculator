import 'dart:convert';

import 'floor.dart';

class HouseSettings {
  int houseWidth = 0;
  int houseLength = 0;
  int opletkaHeight = 0;
  int floorHeight = 0;
  int doorHeight = 0;
  int windowHeight = 0;

  HouseSettings(this.houseWidth, this.houseLength, this.opletkaHeight,
      this.floorHeight, this.doorHeight, this.windowHeight);
}

class House {



  String name = "Новый дом";
  List<Floor> floors = [];
  HouseSettings settings = HouseSettings(0, 0, 0, 0, 0, 0);

  House();
  House.full(String name, 
      List<Floor> floors, 
      int houseWidth,
      int houseLength,
      int opletkaHeight,
      int floorHeight,
      int doorHeight,
      int windowHeight);

  bool addFloor(HouseSettings settings){
    if(floors.length < 3){
      floors.add(Floor(floors.length, settings));
      return true;
    }
    else {
      return false;
    }
  }

  String calculate(){

    return "XYU";
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
      "houseSettings": settings,
    };
    return json;
  }
  //deserialization
  House fromJson(String json){
  Map<String, dynamic> map = jsonDecode(json);

  return House.full(map["name"], map["floors"], map["houseWidth"], map["houseLength"], map["opletkaHeight"], map["floorHeight"],map["doorHeight"],map["windowHeight"]);
  }
}