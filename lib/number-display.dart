import 'package:flutter/material.dart';

class NumberDisplay extends StatelessWidget {
  NumberDisplay({this.value: ''});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Wrap(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container( 
                child: Text(
                  value,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellow, backgroundColor: Colors.black),
                ),
              ),
            ),
          ],
        ));
  }
}
