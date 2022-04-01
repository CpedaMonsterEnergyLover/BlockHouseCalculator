import 'dart:convert';

import 'floor.dart';

class House {
  String name = "Новый дом";
  List<Floor> floors = [];
  double houseWidth = 0;
  double houseLength = 0;
  double opletkaHeight = 0;
  double floorHeight = 0;
  double doorHeight = 0;
  double windowHeight = 0;
  House();
  House.full(String name, List<Floor> floors, double houseWidth,double houseLength,double opletkaHeight,double floorHeight, double doorHeight, double windowHeight);
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