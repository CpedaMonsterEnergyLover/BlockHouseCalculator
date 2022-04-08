import 'dart:convert';

import 'package:block_house_calculator/pages/objects/constants.dart';

import 'floor.dart';

class HouseSettings {
  int houseWidth = 10000;
  int houseLength = 15000;
  int opletkaHeight = 3;
  int floorHeight = 3000;
  int doorHeight = 2500;
  int windowHeight = 2000;

  HouseSettings();
}

class House {
  String name = "Новый дом";
  List<Floor> floors = [];
  HouseSettings settings = HouseSettings();

  House();

  House.full(String name, List<Floor> floors, int houseWidth, int houseLength,
      int opletkaHeight, int floorHeight, int doorHeight, int windowHeight);

  bool addFloor(HouseSettings settings) {
    if (floors.length < 3) {
      floors.add(Floor(floors.length, settings));
      return true;
    } else {
      return false;
    }
  }

  double getPerimeterWalls() {
    double res = ((settings.houseLength + settings.houseWidth) * 4 +
        ((settings.houseLength + settings.houseWidth) ~/
                Constants.lagDistance) *
            settings.floorHeight) as double;
    return res;
  }

  double calculate() {
    double res = 0;
    for (var element in floors) {
      res += element.calculate();
    }
    return res;
  }

  void removeFloor(int index) {
    floors.removeAt(index);
    for (var element in floors) {
      element.index = floors.indexOf(element);
    }
  }

//serialization
  Map<String, dynamic> toJson() {
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
  House fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);

    return House.full(
        map["name"],
        map["floors"],
        map["houseWidth"],
        map["houseLength"],
        map["opletkaHeight"],
        map["floorHeight"],
        map["doorHeight"],
        map["windowHeight"]);
  }
}
