import 'dart:math';

import 'package:Cake_Clicker/pages/components/tap_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/money_bloc/money_bloc.dart';
import '../../models/cake.dart';
import '../../models/userdata.dart';

class TapArea extends StatefulWidget {
  const TapArea({Key? key, required this.userdata}) : super(key: key);
  final UserData userdata;

  @override
  State<TapArea> createState() => _TapAreaState();
}

class _TapAreaState extends State<TapArea> {
  bool tapped = false;
  List<TapWidget> clicks = [];
  Random rnd = Random();
  late UserData _userdata;
  late Cake _currentCake;
  late int _clickCount;

  @override
  void initState() {
    _userdata = widget.userdata;
    _currentCake = _userdata.cakes![rnd.nextInt(_userdata.cakes!.length)];
    _clickCount = _currentCake.clickCount!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _heightTapUp = MediaQuery.of(context).size.width * 0.8;
    double _heightTapDown = MediaQuery.of(context).size.width * 0.7;

    return Stack(
      children: [
        Center(
          child: GestureDetector(
            //клик описываю логику пока тут
            onTapDown: (details) {
              final MoneyBloc _moneyBloc = BlocProvider.of<MoneyBloc>(context);
      
              final RenderBox? box = context.findRenderObject() as RenderBox;
              final Offset localOffset =
                  box!.globalToLocal(details.globalPosition);
              var posx = localOffset.dx;
              var posy = localOffset.dy;
              setState(() {
                tapped = !tapped;
                clicks.add(TapWidget(
                  posx: posx,
                  posy: posy - 20,
                ));
                _clickCount--;
                if(_clickCount<=0){
                  
                _currentCake =
                    _userdata.cakes![rnd.nextInt(_userdata.cakes!.length)];
                    _clickCount = _currentCake.clickCount!;
                    _moneyBloc.add(UpdateMoney(cake: _currentCake));
                    clicks.clear();
                }
              });
            },
            onTapUp: (details) {
              setState(() {
                tapped = !tapped;
              });
            },
            child: SizedBox(
                height: !tapped ? _heightTapUp : _heightTapDown,
                child: Image.asset(
                  _currentCake.image!,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        ...clicks,
        Positioned(
          top: MediaQuery.of(context).size.height*0.2,
          left:  MediaQuery.of(context).size.width*0.45,
          child: Row(
            children: [
              Image.asset('assets/GUI/face_on_heart.png', height: 30,),
              const SizedBox(width: 8,),
              Text('$_clickCount'),
            ],
          ))
      ],
    );
  }
}
