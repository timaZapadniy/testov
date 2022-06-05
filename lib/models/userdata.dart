import 'package:flutter/cupertino.dart';

import 'cake.dart';

class UserData{
  String? name;
  String? background;
  List<Cake>? cakes;
  int money;
  UserData({this.name, this.background,  this.cakes, required this.money});
factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      background: json['background'],
      cakes: null,
      money: json['money'],
    );
  }
   

  Map<String, dynamic> toJson() => 
  {
    'name': name,
    'background': background,
    'cakes': cakesToString(cakes!),
    'money': money,
  };
  cakesToString(List<Cake> cakes){
    String i = '[';
cakes.forEach((element){
i = i+element.toJson().toString()+',';
});
i= i+']';
return i;
}
}
