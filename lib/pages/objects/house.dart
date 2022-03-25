import 'dart:convert';

import 'floor.dart';

class House {
  String name = "Новый дом";
  List<Floor> floors = [];
  House();
  House.full(String name, List<Floor> floors);
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



  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};

    Map<String, dynamic> floorsMap = {};
    for (var floor in floors) {
      floorsMap[floor.index.toString()] = floor.toJson();
    }

    json = {
      "name": name,
      "floors": floorsMap
    };
    return json;
  }

  House fromJson(String json){
  Map<String, dynamic> map = jsonDecode(json);

  return House.full(map["name"], map["floors"]);
  }
}