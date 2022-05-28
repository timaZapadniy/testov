import 'package:Cake_Clicker/models/cake.dart';

import 'money_api_provider.dart';

class MoneyRepository{
  final MoneyProvider _moneyProvider =MoneyProvider();
  Future<int> getUserData({required Cake cake}) => _moneyProvider.getMoneyCount(cake: cake);
  
}