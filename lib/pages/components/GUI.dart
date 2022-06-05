import 'package:Cake_Clicker/pages/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/money_bloc/money_bloc.dart';
import '../../generated/l10n.dart';

class GUI extends StatelessWidget {
  const GUI({Key? key, required this.initialMoney}) : super(key: key);
  final int initialMoney;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.07, left: 8, right: 8),
      child: Row(
        children: [
          const SettingsBtn(),
          const Spacer(),
          const DiamondBtn(),
          const SizedBox(
            width: 8,
          ),
          MoneyBtn(
            initialMoney: initialMoney,
          )
        ],
      ),
    );
  }
}

class SettingsBtn extends StatelessWidget {
  const SettingsBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: IconButton(
      icon: const Icon(
        Icons.settings,
        size: 40,
        color: Colors.purple,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Settings()),
        );
      },
    ));
  }
}

class DiamondBtn extends StatelessWidget {
  const DiamondBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: [
        Image.asset(
          'assets/GUI/faceon_gold_coin.png',
          height: 30,
        ),
        const Text('0'),
      ],
    ));
  }
}

class MoneyBtn extends StatelessWidget {
  const MoneyBtn({Key? key, required this.initialMoney}) : super(key: key);
  final int initialMoney;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: [
        Image.asset(
          'assets/GUI/faceon_silver_coin.png',
          height: 30,
        ),
        BlocBuilder<MoneyBloc, MoneyState>(builder: (context, state) {
          if (state is MoneyInitial) {
            return Text('$initialMoney');
          }
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
    ));
  }
}
