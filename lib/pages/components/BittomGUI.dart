import 'package:flutter/material.dart';

class BottomGUI extends StatelessWidget {
  const BottomGUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.07,
      left: 8,
      right: 8,
      child: SizedBox(
        child: Row(
          children: [
            Expanded(child: Icon(Icons.more)),
            Expanded(child: Icon(Icons.shopping_bag)),
            Expanded(child: Icon(Icons.book)),
            Expanded(child: Icon(Icons.rate_review_outlined)),
          ],
        ),
      ),
    );
  }
}
