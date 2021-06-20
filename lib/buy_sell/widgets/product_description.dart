import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final description;
  Description(this.description);
  @override
  Widget build(BuildContext context) {
    return Text(
      description == null ? "No Discription added." : description ,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: 20,
      ),
    );
  }
}
