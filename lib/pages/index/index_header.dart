
import 'package:flutter/material.dart';

class IndesHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (){},
            child: Text('发现'),
          )
        ],
      ),
    );
  }
}