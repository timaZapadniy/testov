import 'package:flutter/cupertino.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'loading...'
        ),
      ),
    );
  }
}
