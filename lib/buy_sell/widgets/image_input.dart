import 'package:flutter/material.dart';

class ImageInput extends StatelessWidget {
  const ImageInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.5,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0XFFC4C4C4),
      ),
      child: Icon(
        Icons.add_a_photo_outlined,
        color: Color(0XFFFDF4F4),
        size: MediaQuery.of(context).size.shortestSide / 8,
      ),
    );
  }
}
