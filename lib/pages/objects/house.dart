import 'floor.dart';

class House {
  String name = "Новый дом";
  List<Floor> floors = [];

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
}