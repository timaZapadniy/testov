import 'dart:math';

import 'package:Cake_Clicker/bloc/loading_bloc/loading_bloc.dart';
import 'package:Cake_Clicker/pages/components/tap_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/cake.dart';
import '../models/userdata.dart';
import 'components/GUI.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.userdata}) : super(key: key);
  final UserData userdata;
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {


  

 


  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       SizedBox(
         height: double.infinity,
         width: double.infinity,
         child: Image.asset(widget.userdata.background!, fit: BoxFit.cover,)
       ),
       TapArea(userdata: widget.userdata,),
       GUI(initialMoney: widget.userdata.money,)
     ],
   );
   
 
  }
}

