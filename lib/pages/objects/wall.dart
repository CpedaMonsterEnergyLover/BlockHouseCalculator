import 'dart:convert';

class Wall{
  double length = 0.0;
  Wall();
  Wall.full(double length);

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};
    json = {
      "length": length,
    };
    return json;
  }


  Wall fromJson(String json){
    Map<String, dynamic> map = jsonDecode(json);
    return Wall.full(map["length"]);
  }
}