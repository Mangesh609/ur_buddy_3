import 'package:flutter/material.dart';

class CustomAlertDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(20),
      title: Text(
        "Fields can\'t be empty.",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      content: InkWell(
        onTap: Navigator.of(context).pop,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 80,vertical: 10),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black
          ),
          child: Center(
            child: Text(
              "Ok",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
      elevation: 2,
    );
  }
}
