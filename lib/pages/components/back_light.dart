import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackLight extends StatefulWidget {
  const BackLight({Key? key}) : super(key: key);

  @override
  State<BackLight> createState() => _BackLightState();
}

class _BackLightState extends State<BackLight> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // fit: BoxFit.contain,
      'assets/GUI/back_light2.png',
    );
  }
}
