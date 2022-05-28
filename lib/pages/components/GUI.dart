import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/money_bloc/money_bloc.dart';
import '../../generated/l10n.dart';

class GUI extends StatelessWidget {
  const GUI({Key? key, required this.initialMoney}) : super(key: key);
  final int initialMoney;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height*0.06,
          right: MediaQuery.of(context).size.width*0.06,
          child: Row(
            children: [
              Image.asset('assets/GUI/faceon_gold_coin.png', height: 30,),
              const Text('0'),
              const SizedBox(width: 8,),
              Image.asset('assets/GUI/faceon_silver_coin.png', height: 30,),
              BlocBuilder<MoneyBloc, MoneyState>(
                  builder: (context, state) {
                if (state is MoneyInitial) {
                  return Text('$initialMoney');}
                if (state is UpdatedMoney) {
                  
                  return Text('${state.moneyCount}');
                  //});
                }
                if (state is ErrorMoney) {
                  return const Text('error');
                }
                return const Text('');
              })
            ],
          ))
      ],
    );
  }
}