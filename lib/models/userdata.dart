import 'package:flutter/cupertino.dart';

import 'cake.dart';

class UserData{
  String? name;
  String? background;
  List<Cake>? cakes;
  int money;
  UserData({this.name, this.background,  this.cakes, required this.money});
}