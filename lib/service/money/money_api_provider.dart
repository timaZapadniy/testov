import 'dart:convert';

import 'package:Cake_Clicker/models/userdata.dart';

import '../../models/cake.dart';
import 'package:Cake_Clicker/main.dart' as Main;

class MoneyProvider {
  Future<int> getMoneyCount({required Cake cake}) async {
    Main.GlobalUser!.money = Main.GlobalUser!.money+cake.priceCount!;

var i = Main.GlobalUser!.toJson();

    return Main.GlobalUser!.money;
  }
}