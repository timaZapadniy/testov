import '../../models/cake.dart';
import 'package:Cake_Clicker/main.dart' as Main;

class MoneyProvider {
  Future<int> getMoneyCount({required Cake cake}) async {
    Main.GlobalUser!.money = Main.GlobalUser!.money+cake.priceCount!;


    return Main.GlobalUser!.money;
  }
}