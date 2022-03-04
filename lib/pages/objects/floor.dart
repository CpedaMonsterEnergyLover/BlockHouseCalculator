class Floor {
  int index;

  Floor(this.index);

  String getName(){
    return "Этаж " + (index + 1).toString();
  }
}