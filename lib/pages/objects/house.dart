import 'floor.dart';

class House {
  String name = "Новый дом";
  List<Floor> floors = [];

  void addFloor(){
    floors.add(Floor(floors.length));
  }

  void removeFloor(int index){
    floors.removeAt(index);
    for (var element in floors) {
      element.index = floors.indexOf(element);
    }
  }
}