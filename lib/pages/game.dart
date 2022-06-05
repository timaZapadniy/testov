import 'dart:math';
import 'dart:typed_data';

import 'package:Cake_Clicker/bloc/loading_bloc/loading_bloc.dart';
import 'package:Cake_Clicker/pages/components/BittomGUI.dart';
import 'package:Cake_Clicker/pages/components/tap_area.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/cake.dart';
import '../models/userdata.dart';
import 'components/GUI.dart';
import 'components/back_light.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.userdata}) : super(key: key);
  final UserData userdata;
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/music/back_music.wav";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes =
          await rootBundle.load(audioasset); //load audio from assets
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        maxduration = d.inMilliseconds;
        setState(() {});
      });

      player.onAudioPositionChanged.listen((Duration p) {
        currentpos =
            p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });
      });
      int result = await player.playBytes(audiobytes);
      if (result == 1) {
        //play success
        setState(() {
          isplaying = true;
          audioplayed = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              widget.userdata.background!,
              fit: BoxFit.cover,
            )),
        // Center(
        //   child: BackLight(),
        // ),
        TapArea(
          userdata: widget.userdata,
        ),
        GUI(
          initialMoney: widget.userdata.money,
        ),
        BottomGUI()
      ],
    );
  }
}
