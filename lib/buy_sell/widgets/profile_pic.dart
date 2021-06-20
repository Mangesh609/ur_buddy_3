import 'package:flutter/material.dart';

class profilepic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundImage: NetworkImage(
          'https://image.shutterstock.com/image-photo/casually-handsome-confident-young-man-260nw-439433326.jpg'),
      radius: 35,
    );
  }
}
