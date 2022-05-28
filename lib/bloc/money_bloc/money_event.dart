part of 'money_bloc.dart';

@immutable
abstract class MoneyEvent {}
class UpdateMoney extends MoneyEvent{
  final Cake cake;
  UpdateMoney({required this.cake});
}
