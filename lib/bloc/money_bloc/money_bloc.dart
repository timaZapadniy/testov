import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/cake.dart';
import '../../service/money/money_repo.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  final MoneyRepository moneyRepository;
  MoneyBloc({required this.moneyRepository}) : super(MoneyInitial());
  @override
  Stream<MoneyState> mapEventToState(MoneyEvent event) async* {
    if (event is UpdateMoney) {
      yield UpdatingMoney();
      try {
        int _moneyCount = await moneyRepository.getUserData(cake: event.cake);
        yield UpdatedMoney(moneyCount: _moneyCount);
      } catch (_) {
        yield ErrorMoney();
      }
    }
  }
}
