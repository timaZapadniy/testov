import 'package:flutter/material.dart';
import 'package:Cake_Clicker/main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                GlobalUser!.background!,
                fit: BoxFit.cover,
              )),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              const Center(
                child: Text('SETTINGS'),
              ),
              const Spacer(),
              TextButton(
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.white)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'))
            ],
          ),
        ],
      ),
    );
  }
}
