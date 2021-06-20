import 'package:flutter/material.dart';
class button extends StatefulWidget {
  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Text(
            'MAKE AN OFFER',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
