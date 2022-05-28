part of 'money_bloc.dart';

@immutable
abstract class MoneyState {}

class MoneyInitial extends MoneyState {}
class UpdatingMoney extends MoneyState {}
class UpdatedMoney extends MoneyState {
  final int moneyCount;
  UpdatedMoney({required this.moneyCount});
}
class ErrorMoney extends MoneyState {}
