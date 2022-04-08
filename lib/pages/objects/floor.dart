import 'dart:convert';

import 'package:block_house_calculator/pages/objects/constants.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:block_house_calculator/pages/objects/wall.dart';

class Floor {
  int index;
  List<Wall> walls = []; // выглядит как смайлик, смешно? я смеялся.
  List<Wall> doors = [];

  List<Wall> windows = [];

  HouseSettings settings;

  double CalculateWalls() {
    double res = 0;
    for (var e in walls) {
      res += e.length * 2 + e.length ~/ Constants.lagDistance;
    }
    return res;
  }

  double CalculateDoors() {
    double res = 0;
    for (var e in walls) {
      res += e.length + settings.floorHeight * 2;
    }
    return res;
  }

  double CalculateWindows() {
    double res = 0;
    for (var e in walls) {
      res += e.length * 2 + settings.floorHeight * 2;
    }
    return res;
  }

  String getName() {
    return "Этаж " + (index + 1).toString();
  }

  Floor(this.index, this.settings);

  Floor.full(this.index, this.walls, this.doors, this.windows, this.settings);

  double calculate() {
    int P = settings.houseLength * 2 + settings.houseWidth * 2;
    int lagi =
        settings.houseWidth ~/ Constants.lagDistance * Constants.lagWidth;
    int lagi2 =
        settings.houseLength ~/ Constants.lagDistance * Constants.lagWidth;
    return ((P +
                lagi +
                lagi2 +
                CalculateWalls() +
                CalculateDoors() +
                CalculateWindows()) /
            1000000000) *
        Constants.plankWidth *
        Constants.plankHeight;
  }

  addWall(int value) {
    walls.add(Wall(value));
  }

  addDoor(int value) {
    doors.add(Wall(value));
  }

  addWindow(int value) {
    windows.add(Wall(value));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json = {
      "index": index,
      "doorsCount": doors,
      "windowsCount": windows,
      "walls": walls,
    };
    return json;
  }

  Floor fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Floor.full(map["index"], map["doorsCount"], map["windowsCount"],
        map["walls"], map["settings"]);
  }
}
