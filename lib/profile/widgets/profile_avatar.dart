import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  ProfileAvatar({this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Container(
          height: 145,
          width: 134,
          //color: Colors.red,
        ),
        Positioned(
          top: 0,
          child: Container(
            child: Center(
                child: Text(
              name[0].toUpperCase(),
              style: TextStyle(
                  fontSize: 80,
                  color: Color.fromRGBO(253, 244, 244, 1),
                  fontWeight: FontWeight.w500),
            )),
            height: 134,
            width: 134,
            decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(67)),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 22,
          child: Container(
            child: Center(
                child: Text(
              "Batch \'19",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(18, 18, 18, 1)),
            )),
            height: 25,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.amber[300],
                borderRadius: BorderRadius.circular(67)),
          ),
        ),
      ]),
    );
  }
}
