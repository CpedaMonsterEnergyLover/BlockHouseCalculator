class Wall{
  double length = 0.0;


  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};
    json = {
      "length": length,
    };
    return json;
  }


/*  Wall fromJson(){
  }*/
}